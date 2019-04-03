# REF: https://www.ar15.com/forums/armory/Bullet_Drop_Formula/42-351773/#i3198632
class BallisticCalculator
  attr_accessor :ballistic_coefficient
  attr_accessor :velocity
  attr_accessor :range
  attr_accessor :height_of_sight
  attr_accessor :zero_range

  def initialize(bc, v, r, h, z)
    @ballistic_coefficient = bc.to_f
    @velocity = v.to_f
    @range = r.to_f
    @height_of_sight = h.to_f
    @zero_range = z.to_f
  end

  # remaining velocity, fps
  def RV
    ((Math.sqrt(@velocity)) - 0.00863 * (@range / @ballistic_coefficient))**2
  end

  # dummy variable
  def K
    2.878 / (@ballistic_coefficient * Math.sqrt(@velocity))
  end

  # time of flight, seconds
  def TF
    (3 * @range) / (@velocity * (1 - (0.003 * @range * self.K)))
  end

  # dummy variable
  def F
    193 * (1 - ((0.37 * (@velocity - self.RV)) / @velocity))
  end

  # total drop from line of departure, inches
  def DR
    self.F * self.TF**2
  end

  # maximum height of trajectory above sight line, inches
  def MH
    
  end

  # elevation required, moa
  def EL(range)
    orig_range = @range
    @range = range
    value = (100 * (self.DR + @height_of_sight)) / range
    @range = orig_range
    value
  end

  # bullet path above or below line of sight, inches
  def BP
    el0 = self.EL(@zero_range)
    el1 = self.EL(@range)
    ((el0 - el1) * @range) / 100
  end

  # bullet path above or below line of sight, moa
  def BP_moa
    self.BP / (@range / 100)
  end
end
