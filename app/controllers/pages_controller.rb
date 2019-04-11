# frozen_string_literal: true

class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_before_action :authenticate_user!

  def show
    authorize :page
    super
  end

  def invalid_page
    render_404
  end
end
