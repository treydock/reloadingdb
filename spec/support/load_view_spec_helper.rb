# frozen_string_literal: true

module LoadViewSpecHelper
  extend ActiveSupport::Concern

  module ControllerViewHelpers
    def sort_column
      "date"
    end
    def sort_direction
      "asc"
    end
  end
  def initialize_view_helpers(view)
    view.extend ControllerViewHelpers
  end

  included do
    before(:each) do
      initialize_view_helpers(view)
    end
  end
end
