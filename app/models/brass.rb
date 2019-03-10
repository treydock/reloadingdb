class Brass < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  validates :name, presence: true, uniqueness:  { scope: [:caliber, :user] }
  validates :caliber, presence: true

  def name_caliber
    "#{name} (#{caliber.name})"
  end
end
