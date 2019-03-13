class ShootingLog < ApplicationRecord
  include UserOwned
  belongs_to :shooting_location

  validates :date, presence: true
  validates :time, presence: true
end
