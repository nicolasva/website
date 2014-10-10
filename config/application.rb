require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module WebsiteFrancisFerrari
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Paris'

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.enabled = true 
    config.assets.paths << Rails.root.join('public', 'fonts') 
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts', 'flash') 
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'front') 
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'plugins')
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'jquery')
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'boostrap') 
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'common') 
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'admin', 'admin')
    config.assets.version = '1.0'
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr
  end
end
