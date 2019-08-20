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

  def render_test
    # rendering other view
    # render 'routes_test/links'

    # rendering other template
    @products = Product.all
    render template: '/products/index'
    # other options to specify the template:
    # render '/products/index.html.haml'
    # render 'products/index.html.haml'
    # render 'products/index.html'
    # render 'products/index'
    # render 'index'
    # render :index
    # To render a file outside the application (not recommended):
    # render file: "/u/apps/warehouse_app/current/app/views/products/show"

    # - Rendering partials:
    # render partial: 'product' # renders app/views/products/_product.html.haml
    # render partial: 'shared/product' # renders app/views/shared/_product.html.haml
    # - Rails infers partials (all three render app/views/products/_product):
    # render partial: @product
    # render @product
    # render 'product'

    # - Rendering HTML
    # render html: "<strong>Not Found</strong>".html_safe

    # - Rendering inline template (For when the code is too small to put it in a separate template)
    # - Whe can specify how the code will be threated (e.g. 'haml')
    # render inline: "%span.foo #{@foo.name}", type: "haml"

    # - Need to disable forgery protection on this action to permit 
    # - cross-origin JavaScript embedding.
    # render js: "alert('Hello world!')"

    # - Other rendering options
    # render plain: 'Hello'
    # render body: # doesn't specify content type
    # render json: @record
    # render json: @projects, include: :tasks # including relationship
    # render json: @record, callback: 'updateRecordsDisplay' # calling a callback when using JSONP
    # render xml: @record
    # render xml: @projects, include: :tasks
  end

  def redirect_test
    redirect_to controller_test_render_path, notice: "redirected from redirect_test"
  end

  def helpers_test
    render plain: helpers.say_hello
  end
end
