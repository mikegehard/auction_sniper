require 'capybara/cucumber'

require 'capybara/firebug'

require File.dirname(__FILE__) + '/../../app/auction_sniper'

Capybara.app = AuctionSniper

# This is set long since it takes some time one on of my machines to
# connect to the server. Capybara will only wait as long as it has to
# to connect which may not be the full 20 seconds.
Capybara.default_wait_time = 30

Before do
  @test_server = TestAuctionServer.new
  @test_server.start_in_thread
end

After do
  @test_server.stop
  @test_server = nil
end
