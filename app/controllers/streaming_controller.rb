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

  def stream_file
    # used like http://localhost:3000/products?path=/etc/hosts
    send_file(params[:path])

    # in case we need to send textual or binary data
    # we can use send_data, example:
    # send_data img.to_blob, disposition: 'inline', type: 'image/jpg'
  end
end