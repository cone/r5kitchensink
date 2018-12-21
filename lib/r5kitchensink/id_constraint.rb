module R5kitchensink
  module IdConstraint
    def self.matches?(request)
      request.params[:id] =~ /\d+/
    end
  end
end