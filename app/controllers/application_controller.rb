class ApplicationController < ActionController::Base
  before_action :set_variant

  protected

  def set_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/i
  end
end
