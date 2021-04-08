class StoresController < ApplicationController
  before_action :update_user_type
  def index
    @stores = Store.all
    if current_user.user_type != "admin"
    	redirect_to products_path
    end
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to stores_path
    else
      render :new
    end
  end

  def edit
    @store = Store.find_by(:id => params[:id])
  end

  def update
    @store = Store.find_by(:id => params[:id])

    if @store.update(store_params)
      redirect_to stores_path
    else
      render :edit
    end
  end

  def destroy
    store = Store.find_by(:id => params[:id])
    store.destroy
     redirect_to stores_path
  end

  private
  def store_params
  	params.require(:store).permit!
  end

  def update_user_type
    return if User.find_by(:user_type => "admin")
    total_count = User.sum(:sign_in_count)
    if total_count == current_user.sign_in_count
      current_user.update(:user_type => "admin")
    end
  end
end
