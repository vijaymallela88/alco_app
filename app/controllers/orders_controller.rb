class OrdersController < ApplicationController
  def index
    if current_user.user_type == "admin"
      @orders = Order.all
    else
      @orders = Order.where(:customer_id => current_user.id)
    end
  end
end
