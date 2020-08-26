class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :destroy, :update, :detail, :show]
  attr_reader :product

  def index
    @products = Product.all
    # this allows views to be rendered as they are processed
    # the layout is rendered first, then each part of the template
    render stream: true
  end

  def show
    # rendering other action's view
    # render action: 'new' # doesn't execute the "new" method

    render plain: "this is the product, id = #{params[:id]}"
  end

  def new
    @product = Product.new()
  end

  def create
    if Product.create(product_params)
      redirect_to products_path
    else
      render plain: 'There was an error'
    end
  end

  def destroy
    product.destroy!
    redirect_to products_path
  end

  def edit
  end

  def update
    product.update_attributes(product_params)
    redirect_to products_path
  end

  def detail
    render plain: 'This is the product detail'
  end

  def all_prods
    respond_to do |format|
      format.html do |html|
        html.mobile do # renders something like app/views/products/all_prods.html+mobile.haml
          @mobile_only_variable = true
        end
      end
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
