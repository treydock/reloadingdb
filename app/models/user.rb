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

  has_settings do |s|
    s.key :default_units, defaults: {
      temperature: Unit.default_temperature,
      speed: Unit.default_speed,
      pressure: Unit.default_pressure,
      length: Unit.default_length,
      distance: Unit.default_distance,
      scope_adjustment: Unit.default_scope_adjustment
    }
  end

  def update_settings(settings)
    self.settings(:default_units).temperature = settings[:default_temperature]
    self.settings(:default_units).speed = settings[:default_speed]
    self.settings(:default_units).pressure = settings[:default_pressure]
    self.settings(:default_units).length = settings[:default_length]
    self.settings(:default_units).distance = settings[:default_distance]
    self.settings(:default_units).scope_adjustment = settings[:default_scope_adjustment]
    self.save
  end
end
