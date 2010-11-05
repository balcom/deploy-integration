require 'json'
require 'rubygems'
require 'sinatra'

def remote(cmd)
  `ssh deploy@#{@payload.repository.homepage} #{cmd}`
end

post '/deploy' do
  @payload = JSON.parse(params[:payload])
  remote "touch ~/test"
  erb :promo
end

get '/*' do
  erb :promo
end