require 'sinatra'
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