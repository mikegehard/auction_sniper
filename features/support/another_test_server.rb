#require 'faye/websocket'
#
#App = lambda do |env|
#  if Faye::EventSource.eventsource?(env)
#    es = Faye::EventSource.new(env)
#    p [:open, es.url, es.last_event_id]
#
#    # Periodically send messages
#    #loop = EM.add_periodic_timer(1) { es.send('Hello') }
#    ws.onmessage = lambda do |event|
#      ws.send(event.data)
#    end
#    es.onclose = lambda do |event|
#      #EM.cancel_timer(loop)
#      es = nil
#    end
#
#    # Return async Rack response
#    es.rack_response
#
#  else
#    # Normal HTTP request
#    [200, {'Content-Type' => 'text/plain'}, ['Hello']]
#  end
#end
