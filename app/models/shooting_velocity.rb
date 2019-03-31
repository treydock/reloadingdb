class ShootingVelocity < ApplicationRecord
  include UserOwned
  include HasLoad
  belongs_to :caliber

  serialize :velocities, ArrayOfIntegersSerializer

  before_save :remove_blank_velocities

  validates :date, presence: true
  validate :velocity_integers

  scoped_search on: [:date], complete_value: true

  def average_velocity
    return nil if velocities.nil? || velocities.size == 0
    avg = velocities.inject(0.0) { |sum, el| sum + el } / velocities.size
    avg.to_i
  end

  def velocity_unit
    self[:velocity_unit].present? ? self[:velocity_unit] : user.settings(:default_units).velocity
  end

  private

  def remove_blank_velocities
    return nil if velocities.nil?
    velocities.reject!(&:blank?)
  end

  def velocity_integers
    return unless velocities.present?
    velocities.each do |v|
      if v.to_i.to_s != v.to_s
        errors.add(:velocities, "#{v} is not a valid integer")
      end
    end
  end

end
