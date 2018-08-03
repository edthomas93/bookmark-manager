require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  get '/' do
    redirect '/submit-bookmarks'
  end

  get '/submit-bookmarks' do
    erb :input
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/new-bookmarks' do
    if Bookmark.valid_url?(url: params['url'])
      Bookmark.create(url: params['url'])
      redirect '/bookmarks'
    else
      flash[:notice] = "URL does not exist"
    end

    redirect '/new-bookmarks'
  end

  run! if app_file == $0
end
