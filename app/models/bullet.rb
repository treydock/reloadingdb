class Bullet < ApplicationRecord
  include UserOwned
  include HasCaliber
  has_many :loads, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: [:caliber, :user] }
  validates :grain, numericality: { only_integer: true }
  validates :ballistic_coefficient, numericality: true, allow_blank: true

  scoped_search on: [:name, :grain], complete_value: true

  scope :kept, -> { undiscarded.joins(:caliber).merge(Caliber.kept) }

  def name_caliber_grain
    "#{name} (#{caliber.name} - #{grain}gr)"
  end

  def name_full
    name_caliber_grain
  end

  def ballistic_coefficient_full
    return ballistic_coefficient unless ballistic_coefficient.present?
    "#{ballistic_coefficient} #{ballistic_coefficient_unit}"
  end

  def ballistic_coefficient_unit
    self[:ballistic_coefficient_unit].present? ? self[:ballistic_coefficient_unit] : user.settings(:default_units).ballistic_coefficient
  end
end
