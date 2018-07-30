require 'sinatra/base'
require 'sinatra'

class Bookmark < Sinatra::Base
  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    bookmarks = [
      "http://makersacademy.com",
      "http://destroyallsoftware.com",
      "http://google.com"
    ]
    bookmarks.join
  end

  run! if app_file == $0
end
