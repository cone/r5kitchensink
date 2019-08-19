class RepOfResourcesController < ApplicationController
  def respond_to_method
    respond_to do |format|
      @p = Product.all
      format.html
      format.xml { render xml: @p }
    end
  end
end