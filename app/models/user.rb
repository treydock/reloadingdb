class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :brasses
  has_many :bullets
  has_many :calibers
  has_many :loads
  has_many :powders
  has_many :primers
  has_many :shooting_locations
  has_many :shooting_logs
end
