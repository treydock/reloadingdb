class ShootingLog < ApplicationRecord
  include UserOwned
  include HasWindSpeed
  belongs_to :shooting_location
  has_many :shooting_groups

  validates :date, presence: true
  validates :time, presence: true

  def temperature_unit
    self[:temperature_unit].present? ? self[:temperature_unit] : user.settings(:default_units).temperature
  end

  def pressure_unit
    self[:pressure_unit].present? ? self[:pressure_unit] : user.settings(:default_units).pressure
  end
end
