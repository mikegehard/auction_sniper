Given /^there is an open auction$/ do
  @test_server.start_auction
end

When /^I have successfully joined the auction$/ do
  # This doesn't do anything and is simply added for readability of the
  # Cucumber scenario.
  # The test server will always successfully join me to the auction.
end


When /^the auction closes$/ do
  @test_server.close_auction
end
