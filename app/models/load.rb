class Load < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  belongs_to :brass
  belongs_to :bullet
  belongs_to :powder
  belongs_to :primer

  validates :date, presence: true
  validates :powder_weight, numericality: true, allow_blank: true
  validates :col, numericality: true, allow_blank: true
  validates :brass_length, numericality: true, allow_blank: true
  validates :brass_uses, numericality: { only_integer: true }, allow_blank: true
  validates :speed, numericality: { only_integer: true }, allow_blank: true
  validates :run_out, numericality: true, allow_blank: true
  validates :rounds, numericality: { only_integer: true }, allow_blank: true

  scoped_search on: [:date], complete_value: true
  scoped_search on: [:brass_length, :col, :speed, :powder_weight], complete_value: true
  scoped_search relation: :caliber, on: :name, complete_value: true, rename: :caliber
  scoped_search relation: :powder, on: :name, complete_value: true, rename: :powder
  scoped_search relation: :primer, on: :name, complete_value: true, rename: :primer
  scoped_search relation: :brass, on: :name, complete_value: true, rename: :brass
  scoped_search relation: :bullet, on: :name, complete_value: true, rename: :bullet
  scoped_search relation: :bullet, on: :grain, complete_value: true, rename: :bullet_grain
end
