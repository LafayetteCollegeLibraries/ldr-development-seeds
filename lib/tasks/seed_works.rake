# frozen_string_literal: true

#
# Rake tasks for importing works
require 'ldr-development-seeds'

namespace :ldr do
  namespace :seed do
    desc 'Seed all work types'
    task all: :environment do
      LdrDevelopmentSeeds.seed_all!
    end

    desc 'Seed Publications'
    task publications: :environment do
      LdrDevelopmentSeeds.seed_publications!
    end

    desc 'Seed Images'
    task images: :environment do
      LdrDevelopmentSeeds.seed_images!
    end

    # desc 'Seed StudentWorks'
    # task :student_works do
    #   LdrDevelopmentSeeds.seed_student_works
    # end
  end
end
