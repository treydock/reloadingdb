class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]

  # POST /users/sign_in
  def create
    flash = :signed_in
    if resource = resource_class.find_for_database_authentication({login: sign_in_params[:login]})
      if resource.valid_password?(sign_in_params[:password])
        if resource.discarded?
          resource.undiscard
          flash = :signed_in_and_recovered
        end
      end
    end
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, flash)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private
    def check_captcha
      unless verify_recaptcha
        redirect_to new_user_session_url
      end 
    end
end
