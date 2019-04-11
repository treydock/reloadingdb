class Powder < ApplicationRecord
  include UserOwned
  has_many :loads, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user }
  scoped_search on: [:name], complete_value: true

  def name_full
    name
  end
end
