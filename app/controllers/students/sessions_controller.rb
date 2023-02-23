# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_resource, only: :destroy
  prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

  def check_captcha
    return if verify_recaptcha

    self.resource = resource_class.new sign_in_params

    respond_with_navigational(resource) do
      flash.discard(:recaptcha_error)
      render :new
    end
  end 
end
