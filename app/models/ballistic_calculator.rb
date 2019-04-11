# frozen_string_literal: true

# REF: https://www.ar15.com/forums/armory/Bullet_Drop_Formula/42-351773/#i3198632
class BallisticCalculator
  include ActiveModel::Model

  attr_accessor :ballistic_coefficient
  attr_accessor :velocity
  attr_accessor :height_of_sight
  attr_accessor :zero_range

  attr_accessor :ranges_max
  attr_accessor :ranges_interval
  attr_accessor :wind_speed

  attr_accessor :caliber_id
  attr_accessor :load_id
  attr_accessor :gun_id

  validates :ballistic_coefficient, numericality: true
  validates :velocity, numericality: true
  validates :height_of_sight, numericality: true
  validates :zero_range, numericality: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @ranges_max ||= 500
    @ranges_interval ||= 100
    @wind_speed ||= 0
  end

  [
    :ballistic_coefficient,
    :velocity,
    :height_of_sight,
    :zero_range,
  ].each do |a|
    define_method(a) do
      value = instance_variable_get("@#{a}")
      if value.present?
        if value.to_i.to_s == value.to_s || value.to_f.to_s == value.to_s
          value = value.to_f
        end
      end
      value
    end
  end

  def self.ranges(max, interval)
    max = max.to_i
    interval = interval.to_i
    (0..max).step(interval).to_a
  end

  # remaining velocity, fps
  def RV(range)
    ((Math.sqrt(velocity)) - 0.00863 * (range / ballistic_coefficient))**2
  end

  # dummy variable
  def K
    2.878 / (ballistic_coefficient * Math.sqrt(velocity))
  end

  # time of flight, seconds
  def TF(range)
    (3 * range) / (velocity * (1 - (0.003 * range * self.K)))
  end

  # dummy variable
  def F(range)
    193 * (1 - ((0.37 * (velocity - self.RV(range))) / velocity))
  end

  # total drop from line of departure, inches
  def DR(range)
    self.F(range) * self.TF(range)**2
  end

  # maximum height of trajectory above sight line, inches
  def MH(range)
    (48.6 * self.TF(range)**2) - (0.4 * height_of_sight)
  end

  # elevation required, moa
  def EL(range)
    (100 * (self.DR(range) + height_of_sight)) / range
  end

  # bullet path above or below line of sight, inches
  def BP(range)
    el0 = self.EL(zero_range)
    if range < zero_range
      el1 = 0.0
    else
      el1 = self.EL(range)
    end
    ((el0 - el1) * range) / 100.0
  end

  # bullet path above or below line of sight, moa
  def BP_moa(range)
    return 0.0 if range == 0
    self.BP(range) / (range / 100.0)
  end

  # wind deflection, inches
  def WD(range, wa = 180)
    wind_angle = wa.to_f
    # if wind_angle > 180.0
    #  wind_angle = 360.0 - wind_angle
    # end
    (wind_speed.to_f / 10) * (wind_angle) * (self.TF(range) - ((3 * range.to_f) / velocity.to_f))
  end

  # wind deflection, moa
  def WD_moa(range, wind_angle = 180)
    return 0.0 if range == 0
    self.WD(range, wind_angle) / (range / 100)
  end

  # USMC method
  # http://www.millettsights.com/resources/shooting-tips/mathematics-for-precision-shooters/
  def wind_drift_moa(range, single_value = false)
    value = ((range / 100) * wind_speed.to_f) / 15
    return value if single_value
    [value.round(1), self.WD_moa(range).round(1)]
  end

  def wind_drift(range)
    moa = self.wind_drift_moa(range, true)
    value = moa * (range / 100)
    [value.round(1), self.WD(range).round(1)]
  end
end
