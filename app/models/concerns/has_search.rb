module HasSearch
  extend ActiveSupport::Concern

  included do
    private

    def self.value_search(value, operator)
      case operator
      when /LIKE/
        value = "%#{value}%"
      else
        value
      end
      value
    end
  end

end 
