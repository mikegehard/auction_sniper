require 'em-websocket'


class TestAuctionServer
  def initialize
    @auction_started = false
    @participants = []
  end

  def start
    @thread = Thread.new do
      EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 9393, :debug => true) do |ws|
        ws.onopen { ws.send "Hello:" }
        ws.onmessage do |msg|
          ws.send(process_message msg)
        end
        ws.onclose { puts "WebSocket closed" }
        ws.onerror { |e| puts "Error: #{e.message}" }
      end
    end
  end

  def stop
    Thread.kill(@thread)
    puts "Stopped test server."
  end

  def start_auction
    @auction_started = true
  end

  def close_auction
    @auction_started = false
  end

  def auction_joined?
    @participants.length == 1
  end

  private
  def process_message(message)
    #assume that you will always get a join message (Join:<participant_id>)
    participant_id = message.split(':').last
    @participants << participant_id
    # simulate a little delay in the connection
    sleep 1
    "Successfully Joined:"
  end


end
