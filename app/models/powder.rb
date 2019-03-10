class Powder < ApplicationRecord
  include UserOwned
  validates :name, presence: true, uniqueness: { scope: :user }
end
