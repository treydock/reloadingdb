# frozen_string_literal: true

class ShootingLog < ApplicationRecord
  include UserOwned
  include HasWindSpeed
  belongs_to :shooting_location, optional: true
  belongs_to :caliber, optional: true
  has_many :shooting_groups, dependent: :destroy

  validates :date, presence: true
  validates :time, presence: true

  scoped_search on: [:date], complete_value: true
  scoped_search relation: :shooting_location, on: :name, complete_value: true, rename: :location
  scoped_search relation: :caliber, on: :name, complete_value: true, rename: :caliber

  def name_full
    date
  end

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
