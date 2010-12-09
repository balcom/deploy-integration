require 'json'
require 'rubygems'
require 'sinatra'

def get_payload
  @payload = JSON.parse(params[:payload])
end

def remote(cmd)
  `ssh deploy@184.106.150.22 #{cmd}`
end

post '/deploy' do
  get_payload
  remote `cd /srv/#{@payload["repository"]["name"]} && git pull`
  erb :promo
end

get '/*' do
  erb :promo
end
