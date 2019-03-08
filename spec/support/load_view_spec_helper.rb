module LoadViewSpecHelper
  module ControllerViewHelpers
    def sort_column
      'date'
    end
    def sort_direction
      'asc'
    end
  end
  def initialize_view_helpers(view)
    view.extend ControllerViewHelpers
  end
end
