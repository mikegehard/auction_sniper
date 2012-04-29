describe 'AuctionMessageProcessor', ->
  describe 'connected message', ->
    @connectedSpy = null
    @closedSpy = null
    @priceSpy = null
    @processor = null

    beforeEach ->
      @connectedSpy = jasmine.createSpy('connectedCallback')
      @closedSpy = jasmine.createSpy('closedCallback')
      @priceSpy = jasmine.createSpy('priceCallback')
      callbacks = {
        connected: @connectedSpy,
        closed: @closedSpy,
        priceReceived: @priceSpy,
      }

      @processor = new AuctionMessageProcessor(callbacks)

    it 'only calls the connected callback when a connected message is received', ->
      @processor.process('Hello:')
      expect(@connectedSpy).toHaveBeenCalled()

    it 'calls the closed callback when a closed message is received', ->
      @processor.process('AuctionClosed:')
      expect(@closedSpy).toHaveBeenCalled()

    it 'calls the priceReceived callback when a price message is received', ->
      @processor.process('Price:100:85')
      expect(@priceSpy).toHaveBeenCalledWith(100, 85)


