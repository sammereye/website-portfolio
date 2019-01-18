# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# use Rack::ReverseProxy do
#     reverse_proxy(/^\/eft(\/.*)$/,
#     'https://warm-shore-40425.herokuapp.com/',
#     opts = {:preserve_host => true})
# end



run Rails.application