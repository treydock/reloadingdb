class Brass < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  validates :name, presence: true, uniqueness:  { scope: [:caliber, :user] }
  validates :caliber, presence: true

  scoped_search on: [:name], complete_value: true
  scoped_search relation: :caliber, on: :name, complete_value: true, rename: :caliber

  def name_caliber
    "#{name} (#{caliber.name})"
  end
end
