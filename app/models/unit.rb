class Unit
  include ActiveModel::Model

  def self.default_temperature
    'F'
  end

  def self.temperature
    ['F','C']
  end

  def self.default_velocity
    'mph'
  end

  def self.velocity
    ['mph','kph']
  end

  def self.default_pressure
    'inhg'
  end

  def self.pressure
    ['atm','mbar','psi','inhg','mmhg']
  end

  def self.default_length
    'in'
  end

  def self.length
    ['in','mm','cm','moa']
  end

  def self.default_distance
    'yd'
  end

  def self.distance
    ['yd','m']
  end

  def self.default_scope_adjustment
    'moa'
  end

  def self.scope_adjustment
    ['moa','mil','clicks','in','cm']
  end

  def self.default_ballistic_coefficient
    'lb/in^2'
  end

  def self.ballistic_coefficient
    ['lb/in^2','kg/m^2']
  end
end
