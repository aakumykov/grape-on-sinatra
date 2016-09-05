class Web < Sinatra::Base
  get '/' do
    'Hello world.'
  end

  get '/post_form' do
	  File.read(File.join('public','post.html'))
  end
end