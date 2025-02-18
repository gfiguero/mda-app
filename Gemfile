source "https://rubygems.org"

gem "rails", "~> 8.0.1"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

gem "devise"
gem "cancancan"
gem "bcrypt", "~> 3.1"
gem "rails-i18n", "~> 8.0.0" # For Rails >= 8.0.0
gem "pagy"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "tailwindcss-rails"

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "standard", require: false
  gem "faker"
  gem "foreman"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
