# Generated with rails g controller RoutesTest --no-helper --no-assets --no-template-engine
class RoutesTestController < ApplicationController
  attr_accessor :dummy, :test

  def index
    render plain: 'this is route_test#index'
  end

  def show
    render plain: "this is route_test#show with id = #{params[:id]}"
  end

  def links
  end

  def hard_coded_param
    render plain: "this is route_test#hard_coded_param with param = #{params[:hardcoded]}"
  end

  def format_responder
    respond_to do |format|
      # like this to render the associated view
      # format.html
      # to respond to all formats
      # format.any
      format.html { render inline: '<h1>Hello</h1>' }
      format.json { render json: '{ "greeting" : "Hello" }' }
    end
  end

  def error
    render plain: 'constraint error'
  end

  def globbing
    render plain: params[:items]
  end

  def show_dummy
    @dummy = Dummy.find(params[:id])
    render plain: "this is route_test#show_dummy, the dummy name is = #{dummy.name}"
  end

  def show_dummy_test
    @test = Dummy.find(params[:id]).tests.where(id: 1)
    render plain: "this is route_test#show_dummy_test, the test name is = #{test.name}"
  end
end
