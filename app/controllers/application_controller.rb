class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :render_404

  protected

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      request.referer || root_path
    end
  end

  private

  def record_not_found
    flash[:error] = "Record not found"
    redirect_to action: 'index'
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.any  { head :not_found }
    end
  end
end
