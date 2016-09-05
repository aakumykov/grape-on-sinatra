class API < Grape::API
	format :json

	resource '/items' do

		get '/' do
			{ list:'items' }
		end

		get '/:id' do
			{ view: 'item' }
		end

		post '/new' do
			{ new: 'item' }
		end

		get ':id/edit' do
			{ edit: 'item' }
		end

		delete ':id/delete' do
			{ delete: 'item' }
		end
	end
end