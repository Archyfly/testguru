require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Irkutsk'
    # Автозагрузка всех языковых файлов
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    # Дефолтовый язык
    config.i18n.default_locale = :ru

    # Возврат к английскому при ошибках
    config.i18n.fallbacks = [:en]

    # Так же можно указывать какой язык использовать при ошибках
    config.i18n.fallbacks = {'ru' => 'en'}
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end

end
