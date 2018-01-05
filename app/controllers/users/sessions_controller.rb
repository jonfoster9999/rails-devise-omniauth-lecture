require 'securerandom'
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end

    session[:user_id] = @user.id
    sign_in(@user)
    render 'application/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
