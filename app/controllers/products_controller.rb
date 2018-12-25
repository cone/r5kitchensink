class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
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
    @product = Product.find(params[:id])
    @product.destroy!
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
