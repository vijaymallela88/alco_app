# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def sign_up_params
    params.require(:user).permit(:name, :age, :address, :mobile_number, :user_type, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :age, :address, :mobile_number, :user_type, :email, :password, :password_confirmation, :current_password)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
