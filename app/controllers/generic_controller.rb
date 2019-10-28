class GenericController < ApplicationController
  before_action :set_variable, only: :callbacks_test
  before_action do
    @callback_var += " and also this one. "
  end
  after_action R5kitchensink::TestCallback

  def callbacks_test
    render plain: "the variable set by the callback is = #{@callback_var}"
  end

  private

  def set_variable
    @callback_var = "This is a variable set by the callback"
  end
end
