class Gun < ApplicationRecord
  include UserOwned
  include HasCaliber

  validates :name, presence: true, uniqueness: { scope: :user }

  scoped_search on: [:name], complete_value: true

  def sight_height_unit
    self[:sight_height_unit].present? ? self[:sight_height_unit] : user.settings(:default_units).length
  end

  def zero_distance_unit
    self[:zero_distance_unit].present? ? self[:zero_distance_unit] : user.settings(:default_units).distance
  end

  def sight_height_full
    return sight_height unless sight_height.present?
    "#{sight_height} #{sight_height_unit}"
  end

  def zero_distance_full
    return zero_distance unless zero_distance.present?
    "#{zero_distance} #{zero_distance_unit}"
  end
end
