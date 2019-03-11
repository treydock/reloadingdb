class Brass < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  validates :name, presence: true, uniqueness:  { scope: [:caliber, :user] }
  validates :caliber, presence: true
end
