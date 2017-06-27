require 'sinatra'

# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'


get '/' do
	erb :home
end

get '/gallery' do
	erb :gallery
end

get '/ordering' do
	erb :ordering
end

# for ordering form:
post '/ordering' do
	p params
	to = Email.new(email: params[:email])
	from = Email.new(email: 'katypola03@yahoo.com')
	subject = 'Your order is being processed!'
	content = Content.new(type: 'text/plain', value: 'Thanks, ' + params[:name] + '! Your order is currently being processed by our fantastic warehouse team.  You ordered ' + params[:cases] + ' and for shipping, you chose ' + params[:shipping] +'.  You will receive another email when your order is on the way!')
	mail = Mail.new(from, subject, to, content)
	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers
	redirect '/ordering'
end	

get '/contact' do
  erb :contact
end

post '/contact' do
	# get from form
	p params
	from = Email.new(email: params[:email])
	# hard code, make NEW address
	to = Email.new(email: 'katypola03@yahoo.com')
	subject = params[:subject]
	content = Content.new(type: 'text/plain', value: params[:body])
	mail = Mail.new(from, subject, to, content)
	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers
	redirect '/contact'
end