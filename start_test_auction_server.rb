$LOAD_PATH.unshift('.')

require 'features/support/test_auction_server'

test_server = TestAuctionServer.new
test_server.start

while true
  # Use ctrl-c twice to kill server
end
