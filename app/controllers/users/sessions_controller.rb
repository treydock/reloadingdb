class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]

  private
    def check_captcha
      unless verify_recaptcha
        redirect_to new_user_session_url
      end 
    end
end
