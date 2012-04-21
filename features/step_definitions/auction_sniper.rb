When /^I go to the AuctionSniper$/ do
  visit '/'
end
When /^I join the open auction$/ do
  click_button "Join Auction"
end
Then /^the sniper status should be "([^"]*)"$/ do |status|
  page.find_by_id('status').should have_content(status)
end
When /^the AuctionSniper is connected to the auction server$/ do
  wait_until { !page.find_by_id("connecting").visible? }
end
Then /^the AuctionSniper should connect to the auction server$/ do
  page.find_by_id('connecting').should be_visible
end
When /^I successfully join the open auction$/ do
  steps %Q{
    When the AuctionSniper is connected to the auction server
    When I join the open auction
    Then the auction should know that I have joined
  }
end
