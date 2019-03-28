class ShootingGroup < ApplicationRecord
  include UserOwned
  include HasWindSpeed
  include HasVelocity
  include HasSearch

  belongs_to :shooting_log
  belongs_to :load
  belongs_to :caliber
  delegate :bullet, to: :load

  validates :distance, presence: true, numericality: { only_integer: true }
  validates :number, presence: true, numericality: { only_integer: true }, uniqueness: { scope: [:shooting_log, :caliber, :user] }
  validates :elevation_adjustment_direction, absence: true, unless: Proc.new { |a| a.elevation_adjustment.present? }
  validates :windage_adjustment_direction, absence: true, unless: Proc.new { |a| a.windage_adjustment.present? }

  scoped_search on: [:distance], complete_value: true
  scoped_search relation: :shooting_log, on: :date, complete_value: true, rename: :date
  scoped_search relation: :caliber, on: :name, complete_value: true, rename: :caliber
  scoped_search on: :bullet, ext_method: :find_by_bullet_name
  scoped_search on: :bullet_grain, ext_method: :find_by_bullet_grain
  scoped_search on: :powder, ext_method: :find_by_powder_name

  def name
    "#{shooting_log.date} - ##{number} (#{distance} #{distance_unit})"
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

  private

  def self.search_by_load(key, operator, value, assoc, attr)
    conditions = sanitize_sql_for_conditions(["#{assoc}s.#{attr} #{operator} ?", value_search(value, operator)])
    loads = Load.joins(assoc.to_sym).where(conditions).map(&:id)
    { conditions: "shooting_groups.load_id IN(#{loads.join(',')})" }
  end

  def self.find_by_bullet_name(key, operator, value)
    search_by_load(key, operator, value, 'bullet', 'name')
  end

  def self.find_by_bullet_grain(key, operator, value)
    search_by_load(key, operator, value, 'bullet', 'grain')
  end

  def self.find_by_powder_name(key, operator, value)
    search_by_load(key, operator, value, 'powder', 'name')
  end

end
