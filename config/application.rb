require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += %W(#{config.root}/app/navigation_renders )

    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
    config.assets.precompile += %w( application-layout.css application-print.css application-ie.css application-kendo.css )
    config.assets.precompile += %w( application-lt-ie9.js application-jquery.js application-kendo.js application-layout.js login-layout.js )
    config.assets.precompile += %w( application-date-picker.css )
    config.assets.precompile += %w( application-date-picker.js )
    config.assets.precompile += %w( rma.js )
    config.assets.precompile += %w( rma.css )
    config.assets.precompile += %w( time_offs.js )
    config.assets.precompile += %w( time_offs.css )
    config.assets.precompile += %w( request_types.js )
  end
end
