class AuctionSniper
  constructor: (@auctionServer) ->

  showControls: ->
    $('#controls').show()
    $('#connecting').hide()

  setStatus: (newStatus) ->
    $('#status').text(newStatus)

  initialize: ->
    $('#auctionSniper').show()
    @auctionServer.connect(@showControls);
    $('#join').click =>
      @setStatus "Joining Auction"
      @auctionServer.joinAuction("12345", (=> @setStatus("Joined Auction")), (=> @setStatus("Lost Auction")))

window.AuctionSniper = AuctionSniper


