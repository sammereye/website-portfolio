require_relative 'boot'

require 'rails/all'

config.middleware.insert(0, Rack::ReverseProxy) do
  reverse_proxy_options preserve_host: true
  reverse_proxy '/eft', 'https://warm-shore-40425.herokuapp.com/'
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Website
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.middleware.insert_after ActionDispatch::Static, Rack::Deflater

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
