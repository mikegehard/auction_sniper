Given /^there is an open auction$/ do
  @test_server = TestAuctionServer.new
  @test_server.start_auction
  @test_server.start
end

Then /^the auction server should receive my join request$/ do
  sleep 60
  @test_server.auction_joined?.should be_true
end

When /^I have successfully joined the auction$/ do
  # This doesn't do anything and is simply added for readability of the
  # Cucumber scenario.
  # The test server will always successfully join me to the auction.
end


When /^the auction closes$/ do
  @test_server.close_auction
end
