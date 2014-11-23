require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MeloBlo
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.generators.template_engine = :slim
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    # config.time_zone 'Tokyo'
    config.active_record.default_timezone :local
    config.log_tags = [:remote_ip]
  end
end
