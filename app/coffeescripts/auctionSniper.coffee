class AuctionSniper
  initialize: ->
    $('#join').click ->
      $('#status').text("Joining Auction")

window.auctionSniper = new AuctionSniper


