@javascript @firebug
Feature: Joining an auction

  Scenario: Joining an auction and losing without bidding
    Given there is an open auction
    When I go to the AuctionSniper
    Then the AuctionSniper should connect to the auction server

    When the AuctionSniper is connected to the auction server
    And I join the open auction
    Then the sniper status should be "Joined Auction"
    And the auction should know that I have joined

    When the auction closes
    Then the sniper status should be "Lost Auction"

  Scenario: Joining an auction and successfully placing a bid
    Given there is an open auction
    When I go to the AuctionSniper
    And I successfully join the open auction

    And the auction reports the current auction price
    Then the sniper status should be "Bidding $1098"
    And the auction should receive the sniper bid request

    When the auction closes
    Then the sniper status should be "Lost Auction"

