class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
end
