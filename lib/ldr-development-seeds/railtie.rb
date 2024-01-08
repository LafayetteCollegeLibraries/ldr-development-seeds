# frozen_string_literaL: true

require 'ldr-development-seeds'
require 'rails'

module LdrDevelopmentSeeds
  class Railtie < ::Rails::Railtie
    railtie_name :ldr_development_seeds

    rake_tasks do
      path = File.expand_path(File.dirname(__dir__))
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end
