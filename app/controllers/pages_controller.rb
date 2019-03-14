class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_before_action :authenticate_user!

  def show
    authorize :page
    super
  end
end
