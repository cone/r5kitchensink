module R5kitchensink
  class TestCallback
    def self.after(controller)
      body = controller.response.body
      controller.response.body = body + " -> from after callback"
    end
  end
end