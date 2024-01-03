LDR Development Seeds
------

Lafayette Digital Repository development objects. Uses [Bulkrax] for the heavy-lifting
and creates importers for each work-type.

## Usage

```ruby
# Gemfile
group :development do
  gem 'ldr-development-seeds', github: 'LafayetteCollegeLibraries/ldr-development-seeds', branch: 'main'
end
```

## Word of Caution

In our integration of Bulkrax, we found that creating and running a Bulkrax::Importer
on an empty repository will result in a flurry of errors related to Noid minting.
To circumvent this, manually add a work into the repository before running these tasks.

[Bulkrax]: https://github.com/samvera-labs/bulkrax