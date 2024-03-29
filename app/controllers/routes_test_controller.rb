# Generated with rails g controller RoutesTest --no-helper --no-assets --no-template-engine
class RoutesTestController < ApplicationController
  attr_accessor :dummy, :test
  layout "custom", only: [:render_test, :show] # can also be "except:"
  add_flash_types :error

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
    # Dummy.find([1, 2]) also works bt it raises an exception if any
    # of the records is not found

    # other common ones:
    # Dummy.all, Dummy.first, Dummy.last

    # returns records without any order
    # (depends on whatever order is provided by the database implementation.)
    # Dummy.take
    # SELECT * FROM dummies LIMIT 1

    # Dummy.take(5)
    # SELECT * FROM dummies LIMIT 5

    # defaults to initializing a new instance with
    # the provided parameters if the result set is empty:
    # Dummy.first_or_initialize(name: 'new dummy')
  
    dummyNew = Dummy.new do |d|
      d.name = 'dummy 2'
    end
    # or Dummy.new(name: 'dummy2')
    dummy_status = @dummy.new_record? ? 'new' : 'existent'
    dummy_2status = dummyNew.persisted? ? 'existent' : 'new'
    render plain: "this is route_test#show_dummy, \
                   the dummy name is = #{dummy.name} \
                   and it is #{dummy_status}. But his brother \
                   dummy 2 is #{dummy_2status}"
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

    # - Rendering nothing
    # head :ok
    # head :unauthorized
    # head :created, location: auction_path(@auction) # (201 and location header)

    # - Rendering options:
    # - content type
    # render plain: '<b>Hello<b/>', content_type: "text/html"
    # - layout
    # render layout: false    # disable layout template
    # render layout: 'login'  # a template app/views/layouts is assumed
    # - status
    # render text: "not found", status: 404
  end

  def redirect_test
    redirect_back fallback_location: root_path
    # redirect_to controller_test_render_path, error: "something went wrong.."

    # - More options
    # redirect_to action: "show", id: 5
    # redirect_to product
    # redirect_to "http://www.rubyonrails.org"
    # redirect_to articles_url
    # redirect_to "/"

    # - Specifying status
    # redirect_to post_url(@post), status: :found
    # redirect_to :atom, status: :moved_permanently
    # redirect_to post_url(@post), status: 301
    # redirect_to :atom, status: 302

    # - Notifying params
    # redirect_to controller_test_render_path, notice: "redirected from redirect_test"
    # redirect_to post_url(@post), status: :found, notice: "Pay attention to the road"
    # redirect_to post_url(@post), status: 301, flash: { updated_post_id: @post.id }
    # redirect_to :atom, alert: "Something serious happened"
  end

  def helpers_test
    render plain: helpers.say_hello
  end
end
