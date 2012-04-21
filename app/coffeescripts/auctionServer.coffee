class AuctionServer
  constructor: (@auctionServerUrl) ->
    @callbacks = {}

  connect: (connectedCallback) ->
    @callbacks.connected = connectedCallback
    @ws = new WebSocket("ws://#{@auctionServerUrl}/");
    @ws.onmessage = (evt) =>
      @processMessage evt.data

  joinAuction: (client_id, priceReceivedCallback, closedCallback) ->
    @callbacks.priceReceived = priceReceivedCallback
    @callbacks.closed = closedCallback
    @ws.send("Join:#{client_id}")

  sendBid: (bidAmount) ->
    @ws.send("Bid:#{bidAmount}")

  # Private methods
  # Need to break this out into another class so it can be unit tested.
  processMessage: (message) ->
    console.log("Message = #{message}")

    connectedMessage = RegExp(/^Hello:/)
    auctionClosedMessage = RegExp(/^AuctionClosed:/)
    priceMessage = RegExp(/^Price:/)

    if connectedMessage.test(message)
      @callbacks.connected()
    else if auctionClosedMessage.test(message)
      @callbacks.closed()
    else if priceMessage.test(message)
      # need to parse message here and set the proper values
      [messageType, currentBid, minimumBid] = message.split(":")
      @callbacks.priceReceived(parseInt(currentBid), parseInt(minimumBid))
    else
      alert("Message from server not recognised!")

window.AuctionServer = AuctionServer
