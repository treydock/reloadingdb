class ShootingLocation < ApplicationRecord
  include UserOwned
  validates :name, presence: true, uniqueness: { scope: :user }

  scoped_search on: [:name], complete_value: true
end
