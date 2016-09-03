require 'sinatra'
require 'grape'
system 'clear'

class API < Grape::API
	format :json

	get :hello do
    	{ hello: 'world', params: params }
	end

	get '/:operation/:a/:b' do
		operation = params.operation.to_sym
		a,b = params.a.to_f, params.b.to_f
		{ operation => a.send(operation,b) }
	end


end

class Web < Sinatra::Base
  get '/' do
    'Hello world.'
  end

  get '/post_form' do
	  File.read(File.join('public','post.html'))
  end
end

use Rack::Session::Cookie, secret: Digest::SHA256::hexdigest(rand(10000).to_s)
run Rack::Cascade.new [API, Web]
