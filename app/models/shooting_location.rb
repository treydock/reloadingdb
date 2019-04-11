class ShootingLocation < ApplicationRecord
  include UserOwned
  has_many :shooting_logs, dependent: :nullify

  validates :name, presence: true, uniqueness: { scope: :user }

  scoped_search on: [:name], complete_value: true

  def name_full
    name
  end
end
