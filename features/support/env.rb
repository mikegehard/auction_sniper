require 'capybara/cucumber'

require File.dirname(__FILE__) + '/../../app/auction_sniper'

Capybara.app = AuctionSniper
