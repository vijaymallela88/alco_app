class CartsController < ApplicationController
  def index
    @carts = Cart.where(:customer_id => current_user.id, :status => 1)
    @cart = Cart.new
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
  	@products = Product.all.pluck(:product_name, :id)
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(order_params)
    product = Product.find_by(:id => @cart.product_id)
    product.update(:quantity => product.quantity-1)
    if @cart.save
      redirect_to carts_path
    else
      render :new
    end
  end
  

  def update
  	cart_ids = params[:cart_ids]
  	if cart_ids.present?
	  	cart_ids.each do |val|
	  		cart = Cart.find(val.to_i)
	  		user = User.find_by(:id => current_user.id)
	  		order = Order.new
	  		order.product_id = cart.product_id
	  		order.customer_id = cart.customer_id
        order.customer_name = user.name
	  		order.address = user.address
	  		order.mobile_number = user.mobile_number
	  		order.total_amount = cart.product.price.to_i
	  		order.save
	  		cart.update(:status => 0)
	  	end
    end
    flash[:notice] = "Order placed successfully"
  	redirect_to orders_path
  end

  def destroy
  	@cart = Cart.find_by(:id => params[:id])
  	product = Product.find_by(:id => @cart.product_id)
    product.update(:quantity => product.quantity+1)
    @cart.destroy
     redirect_to carts_path
  end

  private
  def order_params
  	params.require(:cart).permit!
  end
end
