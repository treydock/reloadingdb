class Primer < ApplicationRecord
  include UserOwned
  validates :name, presence: true, uniqueness: true
end
