require "rubygems"
require "sinatra"
require "json"

class App < Sinatra::Application

  set :bind, '0.0.0.0'

  get '/' do
    "<h1>DockerBook Test Sinatra app</h1>"
  end

  get '/webapp' do
    "<h2>This is the webapp builders group</h2>"
  end

  post '/json/?' do
    params.to_json
  end

end
