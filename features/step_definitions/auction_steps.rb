Given /^there is an open auction$/ do
  @test_server.start_auction
end

Then /^the auction should know that I have joined$/ do
  wait_until { @test_server.auction_joined? }
end

When /^the auction closes$/ do
  @test_server.close_auction
end
When /^the auction reports the current auction price$/ do
  @test_server.report_current_price(1000, 98, "other bidder")
end
Then /^the auction should receive the sniper bid request$/ do
  wait_until { @test_server.received_bid?(1098) }
end
