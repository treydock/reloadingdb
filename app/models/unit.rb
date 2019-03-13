class Unit
  include ActiveModel::Model

  def self.temperature
    ['F','C']
  end

  def self.speed
    ['mph','kph']
  end

  def self.pressure
    ['atm','mbar','psi','inhg','mmhg']
  end

  def self.length
    ['in','mm','cm']
  end

  def self.distance
    ['yd','m']
  end
end
