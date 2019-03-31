class Caliber < ApplicationRecord
  include UserOwned
  has_many :bullets
  has_many :brasses
  has_many :loads, -> { order(date: :desc) }
  has_many :guns
  has_many :shooting_logs
  has_many :shooting_groups
  has_many :shooting_velocities
  validates :name, presence: true, uniqueness: { scope: :user }

  scoped_search on: [:name], complete_value: true
end
