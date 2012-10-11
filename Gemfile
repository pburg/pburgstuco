source :rubygems

gem "rails", "3.2.8"

### Configuration

gem "thin", "~> 1.5"
gem "haml-rails", "~> 0.3"

### Utility

gem "jquery-rails", "~> 2.1"

### Assets

group :assets do
  gem "sass-rails",   "~> 3.2"
  gem "coffee-rails", "~> 3.2"

  gem "bootstrap-sass", "~> 2.1"

  gem "uglifier", "~> 1.3"
end

### Environment Specific

group :development, :test do
  gem "rspec-rails", "~> 2.11"
  gem "capybara", "~> 1.1"
  gem "fuubar", "~> 1.1"
end

group :production do
  gem "pg", "~> 0.14"
end
