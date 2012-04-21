require 'em-websocket'

class TestAuctionServer
  def initialize
    @participants = []
    @bids = []
  end

  def start
    EventMachine.run do
      EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 9393, :debug => true) do |ws|
        @ws = ws
        ws.onopen do
          sleep 1
          ws.send "Hello:"
        end
        ws.onmessage do |msg|
          process_message msg
        end
        ws.onclose { puts "WebSocket closed" }
        ws.onerror { |e| puts "Error: #{e.message}" }
      end
    end
  end

  def start_in_thread
    @thread = Thread.new do
      start
    end
  end

  def stop
    Thread.kill(@thread)
    puts "Stopped test server."
  end

  def start_auction
  end

  def close_auction
    @ws.send "AuctionClosed:"
  end

  def auction_joined?
    @participants.length == 1
  end

  def received_bid?(bid_amount)
    @bids.include? bid_amount
  end

  def report_current_price(current_price, minimum_bid, current_winning_bidder)
    begin
      puts "Waiting for auction to be joined"
    end until auction_joined?
    @ws.send("Price:#{current_price}:#{minimum_bid}:#{current_winning_bidder}")
  end

  private
  def process_message(message)
    message_payload = message.split(':').last
    case message
      when /^Join/
        @participants << message_payload
      else
        @bids << message_payload.to_i
    end
  end
end
