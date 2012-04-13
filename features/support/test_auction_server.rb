class TestAuctionServer
  def start
    @thread = Thread.new do
      Rack::Handler::WEBrick.run(self, :Port => "9393", :Host => "localhost")
    end
    sleep 1
    puts "Started test server."
  end

  def stop
    Thread.kill(@thread)
    puts "Stopped test server."
  end

  def start_auction

  end

  def call(env)

  end
end
