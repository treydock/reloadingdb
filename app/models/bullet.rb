class Bullet < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  validates :name, presence: true, uniqueness: { scope: :caliber }
  validates :caliber, presence: true
  validates :grain, numericality: { only_integer: true }

  def name_grain_caliber
    "#{name} (#{caliber.name} - #{grain}gr)"
  end
end
