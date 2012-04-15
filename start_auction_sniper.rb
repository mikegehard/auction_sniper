$LOAD_PATH.unshift('app')

require 'auction_sniper'

AuctionSniper.run! :port => 5678
