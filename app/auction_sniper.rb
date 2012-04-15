require 'sinatra'
require 'haml'
require 'coffee-script'

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

  get '/' do
    haml :index
  end

end
