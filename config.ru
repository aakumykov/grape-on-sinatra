require 'sinatra'
require 'grape'
system 'clear'

require_relative 'api.rb'
require_relative 'web.rb'

use Rack::Session::Cookie, secret: Digest::SHA256::hexdigest(rand(10000).to_s)
run Rack::Cascade.new [API, Web]
