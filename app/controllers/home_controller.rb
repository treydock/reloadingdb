class HomeController < ApplicationController
  after_action :verify_policy_scoped, except: :index

  def index
  end
end
