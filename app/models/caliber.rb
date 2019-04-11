class Caliber < ApplicationRecord
  include UserOwned
  has_many :bullets, dependent: :destroy
  has_many :brasses, dependent: :destroy
  has_many :loads, -> { order(date: :desc) }, dependent: :destroy
  has_many :guns, dependent: :destroy
  has_many :shooting_logs, dependent: :nullify
  has_many :shooting_groups, dependent: :destroy
  has_many :shooting_velocities, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user }

  scoped_search on: [:name], complete_value: true

  def name_full
    name
  end
end
