class Load < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  belongs_to :brass
  belongs_to :bullet
  belongs_to :powder
  belongs_to :primer

  validates :date, presence: true

  scoped_search on: [:date], complete_value: true
  scoped_search relation: :caliber, on: :name, complete_value: true
end
