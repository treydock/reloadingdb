class ShootingLog < ApplicationRecord
  include UserOwned
  belongs_to :shooting_location

  validates :date, presence: true
  validates :time, presence: true

  def temperature_unit
    self[:temperature_unit].present? ? self[:temperature_unit] : user.settings(:default_units).temperature
  end

  def pressure_unit
    self[:pressure_unit].present? ? self[:pressure_unit] : user.settings(:default_units).pressure
  end

  def wind_speed_unit
    self[:wind_speed_unit].present? ? self[:wind_speed_unit] : user.settings(:default_units).speed
  end
end
