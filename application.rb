require 'json'
require 'rubygems'
require 'sinatra'

def get_payload
  @payload = JSON.parse(params[:payload])
end

def remote(cmd)
  `ssh deploy@#{@payload["repository"]["homepage"]} #{cmd}`
end

post '/deploy' do
  get_payload
  remote "/home/deploy/bin/deploy_#{ case @payload["ref"]
    when "refs/heads/master" then "staging"
    when "refs/heads/production" then "production"
    end
  }.sh"
    erb :promo
end

get '/*' do
  erb :promo
end
