# frozen_string_literal: true

module HasWindSpeed
  extend ActiveSupport::Concern

  included do
    validates :wind_direction, absence: true, unless: Proc.new { |a| a.wind_speed.present? }

    def wind_speed_full
      return wind_speed unless wind_speed.present?
      "#{wind_speed} #{wind_speed_unit} (#{wind_direction}#{176.chr(Encoding::UTF_8)})"
    end

    def wind_speed_unit
      self[:wind_speed_unit].present? ? self[:wind_speed_unit] : user.settings(:default_units).speed
    end
  end
end
