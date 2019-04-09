class Load < ApplicationRecord
  include Discard::Model
  include UserOwned
  include HasCaliber
  include HasVelocity
  belongs_to :brass
  belongs_to :bullet
  belongs_to :powder
  belongs_to :primer
  has_many :shooting_groups
  has_many :shooting_velocities

  validates :date, presence: true
  validates :powder_weight, numericality: true, presence: true
  validates :col, numericality: true, presence: true
  validates :brass_length, numericality: true, allow_blank: true
  validates :brass_uses, numericality: { only_integer: true }, allow_blank: true
  validates :run_out, numericality: true, allow_blank: true
  validates :rounds, numericality: { only_integer: true }, allow_blank: true

  scoped_search on: [:date], complete_value: true
  scoped_search on: [:brass_length, :col, :powder_weight], complete_value: true
  scoped_search relation: :powder, on: :name, complete_value: true, rename: :powder
  scoped_search relation: :primer, on: :name, complete_value: true, rename: :primer
  scoped_search relation: :brass, on: :name, complete_value: true, rename: :brass
  scoped_search relation: :bullet, on: :name, complete_value: true, rename: :bullet
  scoped_search relation: :bullet, on: :grain, complete_value: true, rename: :bullet_grain

  def name
    "#{date} - #{bullet.name_caliber_grain} - #{powder.name} (#{powder_weight}gr)"
  end

  def brass_length_full
    return brass_length unless brass_length.present?
    "#{brass_length} #{brass_length_unit}"
  end

  def col_full
    return col unless col.present?
    "#{col} #{col_unit}"
  end

  def run_out_full
    return run_out unless run_out.present?
    "#{run_out} #{run_out_unit}"
  end

  def brass_length_unit
    self[:brass_length_unit].present? ? self[:brass_length_unit] : user.settings(:default_units).length
  end

  def col_unit
    self[:col_unit].present? ? self[:col_unit] : user.settings(:default_units).length
  end

  def run_out_unit
    self[:run_out_unit].present? ? self[:run_out_unit] : user.settings(:default_units).length
  end

  def calculate_velocity
    velocities = shooting_velocities.map(&:velocities).flatten
    return nil unless velocities.present?
    avg = velocities.mean
    avg.to_i
  end

  def clone
    new_load = self.dup
    new_load.date = nil
    new_load.velocity = nil
    new_load
  end
end
