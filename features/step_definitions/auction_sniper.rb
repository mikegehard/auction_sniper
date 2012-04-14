When /^I go to the AuctionSniper$/ do
  visit '/'
end
When /^I join the open auction$/ do
  click_button "Join Auction"
end
Then /^the sniper status should be "([^"]*)"$/ do |status|
  page.find_by_id('status').should have_content(status)
end
