class AuctionSniper
  constructor: (@auctionServer) ->

  showControls: ->
    $('#controls').show()
    $('#connecting').hide()

  setStatus: (newStatus) ->
    $('#status').text(newStatus)

  placeBid: (currentPrice, minimumBid) ->
    bid = currentPrice + minimumBid
    @setStatus("Bidding $#{bid}")
    @auctionServer.sendBid(bid)

  auctionClosed: ->
    @setStatus("Lost Auction")

  initialize: ->
    $('#auctionSniper').show()
    @auctionServer.connect(@showControls);
    $('#join').click =>
      @setStatus "Joined Auction"
      @auctionServer.joinAuction("12345", ((currentPrice, minimumBid) => @placeBid(currentPrice, minimumBid)), ( => @auctionClosed()))

window.AuctionSniper = AuctionSniper


