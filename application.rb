require 'rubygems'
require 'sinatra'

def remote(cmd)
  `ssh deploy@#{@payload.repository.homepage} cmd`
end

get '/*' do
  erb :promo
end

post '/deploy' do
  @payload = JSON.parse(params[:payload])
  remote "echo 'test' > /home/deploy/test"
end