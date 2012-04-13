Given /^there is an open auction$/ do
  @test_server = TestAuctionServer.new
  @test_server.start
  @test_server.start_auction
end
