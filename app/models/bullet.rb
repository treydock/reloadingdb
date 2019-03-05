class Bullet < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  validates :caliber, presence: true
end
