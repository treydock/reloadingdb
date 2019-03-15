class ShootingGroup < ApplicationRecord
  include UserOwned
  include HasWindSpeed
  belongs_to :shooting_log
  belongs_to :load

  validates :distance, presence: true, numericality: { only_integer: true }
  validates :number, presence: true, numericality: { only_integer: true }
  validates :elevation_adjustment_direction, absence: true, unless: Proc.new { |a| a.elevation_adjustment.present? }
  validates :windage_adjustment_direction, absence: true, unless: Proc.new { |a| a.windage_adjustment.present? }

  def name
    "#{shooting_log.date} - #{number} (#{distance} #{distance_unit})"
  end

  def distance_unit
    self[:distance_unit].present? ? self[:distance_unit] : user.settings(:default_units).distance
  end

  def elevation_adjustment_unit
    self[:elevation_adjustment_unit].present? ? self[:elevation_adjustment_unit] : user.settings(:default_units).scope_adjustment
  end

  def windage_adjustment_unit
    self[:windage_adjustment_unit].present? ? self[:windage_adjustment_unit] : user.settings(:default_units).scope_adjustment
  end

  def group_size_unit
    self[:group_size_unit].present? ? self[:group_size_unit] : user.settings(:default_units).length
  end

  def velocity_unit
    self[:velocity_unit].present? ? self[:velocity_unit] : user.settings(:default_units).speed
  end

  def distance_full
    return distance unless distance.present?
    "#{distance} #{distance_unit}"
  end

  def elevation_adjustment_full
    return elevation_adjustment unless elevation_adjustment.present?
    "#{elevation_adjustment} #{elevation_adjustment_unit} #{elevation_adjustment_direction}"
  end

  def windage_adjustment_full
    return windage_adjustment unless windage_adjustment.present?
    "#{windage_adjustment} #{windage_adjustment_unit} #{windage_adjustment_direction}"
  end

  def group_size_full
    return group_size unless group_size.present?
    "#{group_size} #{group_size_unit}"
  end

  def velocity_full
    return velocity unless velocity.present?
    "#{velocity} #{velocity_unit}"
  end
end