class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    flash[:error] = "Record not found"
    redirect_to action: 'index'
  end
end
