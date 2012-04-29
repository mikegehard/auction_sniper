class AuctionMessageProcessor
  constructor: (@callbacks) ->

  process: (message) ->
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

window.AuctionMessageProcessor = AuctionMessageProcessor

