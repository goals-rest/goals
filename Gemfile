source "https://rubygems.org"

# Use main development branch of Rails
gem "rails", github: "rails/rails", branch: "main"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 2.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "1.14.0"

# A UI development environment for Ruby on Rails applications [https://github.com/lookbook-hq/lookbook]
gem "lookbook", "2.3.9"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # To help fixture creation [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails", "6.4.4"

  # The Listen gem listens to file modifications and notifies you about the changes [https://github.com/guard/listen]
  gem "listen", "3.9.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Middleware that isplays speed badge for every HTML page, along with (optional) flamegraphs and memory profiling [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler", "3.3.1"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  # Makes tests easy on the fingers and the eyes [https://github.com/thoughtbot/shoulda]
  gem "shoulda", "5.0.0.rc1"
end

# Rails UI component library [https://github.com/getrailsui/railsui]
gem "railsui", github: "getrailsui/railsui", tag: "v3.0.1"

# A framework for building reusable, testable & encapsulated view components in Ruby on Rails [https://github.com/ViewComponent/view_component]
gem "view_component", "3.23.1"

# A collection of view components helpers [https://github.com/palkan/view_component-contrib]
gem "view_component-contrib", "0.2.4"

# Utility function to efficiently merge Tailwind CSS classes without style conflicts [https://github.com/gjtorikian/tailwind_merge]
gem "tailwind_merge", "1.2.0"

# Centralization of locale data collection for Ruby on Rails [https://github.com/svenfuchs/rails-i18n]
gem "rails-i18n", "~> 8.0.0"

# "A pagination gem [https://github.com/ddnexus/pagy]"
gem "pagy", "~> 9.3"

# Active Storage Validations is a gem that allows you to add validations for Active Storage attributes [https://github.com/igorkasyanchuk/active_storage_validations]
gem "active_storage_validations", "2.0.3"

# Authorization framework for Ruby and Rails applications [https://github.com/palkan/action_policy]
gem "action_policy", "0.7.4"
