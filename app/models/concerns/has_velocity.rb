module HasVelocity
  extend ActiveSupport::Concern

  included do
    validates :velocity, numericality: { only_integer: true }, allow_blank: true

    scoped_search on: [:velocity], complete_value: true

    def velocity_full
      return velocity unless velocity.present?
      "#{velocity} #{velocity_unit}"
    end

    def velocity_unit
      self[:velocity_unit].present? ? self[:velocity_unit] : user.settings(:default_units).velocity
    end
  end

end 
