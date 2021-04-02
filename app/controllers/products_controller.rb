class ProductsController < ApplicationController
  def index
  	if params[:store_id].present?
      @products = Product.where(:store_id => params[:store_id])
  	else
      @products = Product.all
  	end
    customer = User.find_by(:id => current_user.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @stores = Store.all.pluck(:name, :id)
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(:id => params[:id])
  end

  def update
    @product = Product.find_by(:id => params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find_by(:id => params[:id])
    product.destroy
     redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit!
  end
end
