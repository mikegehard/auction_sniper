class AuctionSniper
  constructor: () ->

  showControls: ->
    $('#controls').show()
    $('#connecting').hide()

  setStatus: (newStatus) =>
    $('#status').text(newStatus)

  placeBid: (currentPrice, minimumBid) =>
    bid = currentPrice + minimumBid
    @setStatus("Bidding $#{bid}")
    @auctionServer.sendBid(bid)

  auctionClosed: =>
    @setStatus("Lost Auction")

  initialize: (@auctionServer) ->
    $('#auctionSniper').show()
    @auctionServer.connect()
    $('#join').click =>
      @setStatus "Joined Auction"
      @auctionServer.joinAuction("12345")

window.AuctionSniper = AuctionSniper


