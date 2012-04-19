class AuctionServer
  constructor: (@auctionServerUrl) ->
    @callbacks = {}

  connect: (connectedCallback) ->
    @callbacks.connected = connectedCallback
    @ws = new WebSocket("ws://#{@auctionServerUrl}/");
    @ws.onmessage = (evt) =>
      @processMessage evt.data

  joinAuction: (client_id, joinedCallback, closedCallback) ->
    @callbacks.joined = joinedCallback
    @callbacks.closed = closedCallback
    @ws.send("Join:#{client_id}")


  # Private methods
  processMessage: (message) ->
    console.log("Message = #{message}")
    switch message
      when "Hello:" then @callbacks.connected()
      when "Successfully Joined:" then @callbacks.joined()
      when "AuctionClosed:" then @callbacks.closed()

window.AuctionServer = AuctionServer
