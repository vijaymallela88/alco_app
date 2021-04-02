class StoresController < ApplicationController
  def index
    @stores = Store.all
    User.first.update(:user_type => "admin")
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
end
