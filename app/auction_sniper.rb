require 'sinatra'
require 'haml'
require 'sass'
require 'coffee-script'

class ScssHandler < Sinatra::Base

  set :views, File.dirname(__FILE__) + '/scss'

  get '/css/*.css' do
    filename = params[:splat].first
    scss filename.to_sym
  end

end

class CoffeeHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/coffeescripts'

  get "/javascript/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

class AuctionSniper < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  use CoffeeHandler
  use ScssHandler

  get '/' do
    haml :index
  end

  get '/test_auction_server' do
    haml :test_auction_server
  end

end
