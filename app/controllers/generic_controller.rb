class GenericController < ApplicationController
  before_action :modify_var, only: :callbacks_test
  before_action do
    @callback_var += " and also this one. "
  end
  after_action R5kitchensink::TestCallback
  prepend_before_action :set_variable # executes before any of the 'before_action' callbacks

  def callbacks_test
    render plain: "the variable set by the callback is = #{@callback_var}"
  end

  private

  def set_variable
    @callback_var = "This is a variable set by the callback"
  end

  def modify_var
    @callback_var += ' MODIFIED'
  end
end
