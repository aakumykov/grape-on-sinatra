class API < Grape::API
	format :json

	helpers do
		def print_params
			puts "--------- params begin ---------"
			params.each do |p|
				key = p.first
				value = p.last
				puts "#{key} -> #{value} (#{value.class})"
			end
			puts "--------- params end ---------"
		end
	end

	before do
		params.a = params.a.to_f
		params.b = params.b.to_f
		print_params
	end

	get :hello do
    	{ hello: 'world', params: params }
	end

	params do
		requires :operation, type: String
		requires :a, type: Numeric
		requires :b, type: Numeric
	end
	get '/:operation' do
		operation = params.operation.to_sym
		a,b = params.a.to_f, params.b.to_f
		{ operation => a.send(operation,b) }
	end

	params do
		requires :title, type: String, regexp: /^.+$/
		requires :content, type: String
		optional :comment, type: String, default: 'no comments'
		optional :index, type: Integer, default: '1'
	end
	post '/items/new' do
		result = {}

		params.each do |p|
			key = p.first
			value = p.last

			result[key.to_sym] = value
			puts "#{key} -> #{value} (#{value.class})"

			result
		end
	end
end