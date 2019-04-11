# frozen_string_literal: true

class Brass < ApplicationRecord
  include UserOwned
  include HasCaliber
  has_many :loads, dependent: :destroy

  validates :name, presence: true, uniqueness:  { scope: [:caliber, :user] }

  scoped_search on: [:name], complete_value: true

  scope :kept, -> { undiscarded.joins(:caliber).merge(Caliber.kept) }

  def name_caliber
    "#{name} (#{caliber.name})"
  end

  def name_full
    name_caliber
  end
end
