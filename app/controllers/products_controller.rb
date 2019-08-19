class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :destroy, :update, :detail, :show]
  attr_reader :product

  def index
    @products = Product.all
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

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
