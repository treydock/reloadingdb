# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  prepend_before_action :check_captcha, only: [:create]

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new
        resource.validate # Look for any other validation errors besides Recaptcha
        set_minimum_password_length
        redirect_to new_user_password_url
      end
    end
end
