# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name = 'ldr-development-seeds'
  gem.summary = 'Seeds for local development of Lafayette Digital Repository'
  gem.authors = ['Malantonio, Anna']

  gem.require_paths = ['lib']
  gem.version = '0.0.0'

  gem.files = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR).reject { |f| File.dirname(f).match(%r{\A"?spec/?}) }

  gem.required_ruby_version = '>= 2.7.0'

  gem.add_dependency 'bulkrax'
  gem.add_dependency 'hyrax'
end
