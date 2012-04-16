$LOAD_PATH.unshift('.')

require 'features/support/test_auction_server'

test_server = TestAuctionServer.new
test_server.start

# Use ctrl-c to kill server
