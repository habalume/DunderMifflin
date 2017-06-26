require 'sinatra'
# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

get '/' do
	erb :home
end

get '/gallery' do
	erb :gallery
end

get '/ordering' do
	erb :ordering
end

get '/contact' do
  erb :contact
end

post '/contact' do
	# get from form
	p params
	from = Email.new(email: params[:email])
	# hard code, make NEW address
	to = Email.new(email: 'katyp03@gmail.com')
	subject = params[:title]
	content = Content.new(type: 'text/plain', value: params[:body])
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers
	redirect '/contact'
end