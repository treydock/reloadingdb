class Caliber < ApplicationRecord
  include UserOwned
  has_many :bullets
  has_many :brasses
  has_many :loads
  has_many :guns
  has_many :shooting_logs
  has_many :shooting_groups
  validates :name, presence: true, uniqueness: { scope: :user }

  scoped_search on: [:name], complete_value: true
end
