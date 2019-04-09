class Brass < ApplicationRecord
  include Discard::Model
  include UserOwned
  include HasCaliber
  validates :name, presence: true, uniqueness:  { scope: [:caliber, :user] }

  scoped_search on: [:name], complete_value: true

  def name_caliber
    "#{name} (#{caliber.name})"
  end
end
