require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Goals
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    Rails.autoloaders.main.collapse("#{Rails.root}/app/components/common")
    Rails.autoloaders.main.collapse("#{Rails.root}/app/components/features")

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    config.time_zone = "Brasilia"
    config.i18n.available_locales = [ :en, "pt-BR" ]
    config.i18n.default_locale = "pt-BR"

    # config.eager_load_paths << Rails.root.join("extras")

    config.view_component.preview_paths << "#{Rails.root}/app/components"
    config.lookbook.preview_layout = "component_preview"
    config.lookbook.preview_display_options = {
      theme: [ "light", "dark" ]
    }
  end
end
