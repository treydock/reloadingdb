class ShootingLog < ApplicationRecord
  include Discard::Model
  include UserOwned
  include HasWindSpeed
  belongs_to :shooting_location
  belongs_to :caliber, optional: true
  has_many :shooting_groups

  validates :date, presence: true
  validates :time, presence: true

  scoped_search on: [:date], complete_value: true
  scoped_search relation: :shooting_location, on: :name, complete_value: true, rename: :location
  scoped_search relation: :caliber, on: :name, complete_value: true, rename: :caliber

  def temperature_full
    return temperature unless temperature.present?
    "#{temperature} #{temperature_unit}"
  end

  def pressure_full
    return pressure unless pressure.present?
    "#{pressure} #{pressure_unit}"
  end

  def temperature_unit
    self[:temperature_unit].present? ? self[:temperature_unit] : user.settings(:default_units).temperature
  end

  def pressure_unit
    self[:pressure_unit].present? ? self[:pressure_unit] : user.settings(:default_units).pressure
  end
end
