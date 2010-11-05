require 'json'
require 'rubygems'
require 'sinatra'

def remote(cmd)
  `ssh deploy@#{@payload.repository.homepage} cmd`
end

post '/deploy' do
  @payload = JSON.parse(params[:payload])
  `echo 'test' > ~/test`
  `echo '#{@payload.to_json}' > ~/payload.js`
  erb :promo
end

get '/*' do
  erb :promo
end