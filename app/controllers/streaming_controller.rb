class StreamingController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    10_000.times do |i|
      response.stream.write "Event #{i} just happened\n"
    end
  ensure
    response.stream.close
  end
end