class Caliber < ApplicationRecord
  include UserOwned
  has_many :bullets
  has_many :brasses
  validates :name, presence: true, uniqueness: true
end
