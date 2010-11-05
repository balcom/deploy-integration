require 'rubygems'
require 'sinatra'

def remote(cmd)
  `ssh deploy@#{@payload.repository.homepage} cmd`
end

get '/*' do
  erb :promo
  `echo 'test' > /home/deploy/test`
end

post '/deploy' do
  @payload = JSON.parse(params[:payload])
  `echo #{@payload} > /home/deploy/test`
  remote "echo 'test' > /home/deploy/test"
end