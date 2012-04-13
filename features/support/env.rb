require 'capybara/cucumber'

require File.dirname(__FILE__) + '/../../auction_sniper'

Capybara.app = Sinatra::Application
