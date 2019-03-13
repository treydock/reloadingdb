class ShootingLocation < ApplicationRecord
  include UserOwned
  validates :name, presence: true, uniqueness: { scope: :user }
end
