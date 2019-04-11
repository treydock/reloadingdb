# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  # DELETE /users
  def destroy
    resource.discard
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
  end

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides Recaptcha
        set_minimum_password_length
        redirect_to new_user_registration_url
      end
    end
end
