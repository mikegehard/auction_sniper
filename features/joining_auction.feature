Feature: Joining an auction
  @javascript @firebug
  Scenario: Joining an auction and losing without bidding
    Given there is an open auction
    When I go to the AuctionSniper
    Then the AuctionSniper should connect to the auction server

    When the AuctionSniper is connected to the auction server
    And I join the open auction
    Then the sniper status should be "Joining Auction"

    When I have successfully joined the auction
    Then the sniper status should be "Joined Auction"
#
#    When the auction closes
#    Then the sniper status should be "Lost Auction"
