source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "activestorage"
gem "active_storage_validations"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise"
gem "dotenv"
gem "jbuilder"
gem "jsbundling-rails"
gem "pagy"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.5"
gem "rails-i18n"
gem "redis", "~> 5.4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "whenever"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rails_live_reload"
end

group :development do
  gem "htmlbeautifier"
  gem "rufo"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
