class Unit
  include ActiveModel::Model

  def self.default_temperature
    'F'
  end

  def self.temperature
    ['F','C']
  end

  def self.default_speed
    'mph'
  end

  def self.speed
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
    ['in','mm','cm']
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
end
