# frozen_string_literal: true

require 'bulkrax'

module LdrDevelopmentSeeds
  ALL_TYPES = %i[publication image].freeze

  require 'ldr-development-seeds/railtie' if defined?(Rails)

  def self.seed_all!
    ALL_TYPES.each { |type| Seeder.new(type: type).seed! }
  end

  def self.seed_publications!
    Seeder.new(type: :publication).seed!
  end

  def self.seed_images!
    Seeder.new(type: :image).seed!
  end

  def self.cleanup!
    ALL_TYPES.each do |type|
      importer = begin
        ::Bulkrax::Importer.find_by(name: importer_name_for(type))
      rescue StandardError
        nil
      end
      importer.destroy if importer.present?
    end
  end

  class Seeder
    SEED_IMPORTER_NAME = 'ldr-development-seeds'

    attr_reader :type

    def initialize(type:)
      @type = type.to_s.singularize.to_sym
    end

    def seed!
      importer = create_importer!
      ::Bulkrax::ImporterJob.perform_later(importer.id)
    end

    def create_importer!
      existing = Bulkrax::Importer.find_by(name: importer_name)
      return existing if existing.present?

      raise("I don't know how to import #{type}") unless import_file_exists?

      ::Bulkrax::Importer.create!(
        name: importer_name,
        admin_set_id: 'admin_set/default',
        user_id: User.find_by(email: 'dss@lafayette.edu').id,
        frequency: 'PT0S',
        field_mapping: Bulkrax.field_mappings['Bulkrax::CsvParser'],
        parser_klass: 'Bulkrax::CsvParser',
        parser_fields: parser_fields_for_importer
      )
    end

    def importer_name
      "#{SEED_IMPORTER_NAME}--#{type}"
    end

    def import_file_exists?
      File.exist?(import_file_path)
    end

    def import_file_path
      File.join(__dir__, 'data', "#{type.to_s.pluralize}.csv")
    end

    def parser_fields_for_importer
      {
        'visibility' => 'open',
        'rights_statement' => '',
        'override_rights_statement' => '0',
        'file_style' => 'Specify a Path on the Server',
        'import_file_path' => import_file_path,
        'update_files' => false
      }
    end
  end
end
