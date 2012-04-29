class AuctionServer
  constructor: (@auctionServerUrl, @messageProcessor) ->

  connect: ->
    @ws = new WebSocket("ws://#{@auctionServerUrl}/");
    @ws.onmessage = (evt) =>
      @messageProcessor.process evt.data

  joinAuction: (client_id) ->
    @ws.send("Join:#{client_id}")

  sendBid: (bidAmount) ->
    @ws.send("Bid:#{bidAmount}")

window.AuctionServer = AuctionServer
