require 'rubygems'

before do
  @payload = JSON.parse(params[:payload])
end

def remote(cmd)
  `ssh deploy@#{@payload.repository.homepage} cmd`
end

get '/' do
  remote "echo 'test' > /home/deploy/test"
end