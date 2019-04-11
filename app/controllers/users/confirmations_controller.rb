# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  prepend_before_action :check_captcha, only: [:create]

  private
    def check_captcha
      unless verify_recaptcha
        redirect_to new_user_confirmation_url
      end
    end
end
