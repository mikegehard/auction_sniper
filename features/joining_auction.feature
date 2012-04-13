Feature: Joining an auction
  Scenario: Joining an auction and losing without bidding
    Given there is an open auction
    When I go to the AuctionSniper
    And I join the open auction
    Then I should be alerted that I have joined the auction

    When the open auction closes
    Then I should be alerted that I have lost the auction
