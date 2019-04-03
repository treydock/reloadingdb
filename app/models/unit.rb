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

  def self.default_velocity
    'fps'
  end

  def self.velocity
    ['mph','kph','fps']
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

  def self.scope_moa_adjustments
    [
      ['1/4',0.25],
      ['1/8',0.125],
      ['1/2',0.5],
    ]
  end

  def self.scope_moa_adjustment_name(value)
    return nil unless value.present?
    self.scope_moa_adjustments.select { |a| a[1] == value }[0][0]
  end
end
