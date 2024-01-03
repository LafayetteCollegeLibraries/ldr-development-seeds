# frozen_string_literal: true
Gem::Specification.new do |gem|
  gem.name = 'ldr-development-seeds'
  gem.summary = 'Seeds for local development of Lafayette Digital Repository'
  gem.authors = ['Malantonio, Anna']

  gem.require_paths = ['lib']
  gem.version = '0.0.0'

  gem.files = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR).select { |f| File.dirname(f) !~ %r{\A"?spec\/?} }

  gem.add_dependency 'hyrax', '~> 3'
  gem.add_dependency 'bulkrax', '~> 5'
end
