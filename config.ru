# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  # Set :preserve_host to true globally (default is true already)
  reverse_proxy_options preserve_host: true

  # Forward the path /test* to http://example.com/test*
  reverse_proxy '/eft', 'https://warm-shore-40425.herokuapp.com/'

end

run Rails.application