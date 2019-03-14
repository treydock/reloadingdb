class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  after_action :verify_policy_scoped, except: :index

  def index
  end
end
