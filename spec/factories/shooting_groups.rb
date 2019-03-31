FactoryBot.define do
  factory :shooting_group do
    shooting_log
    user
    caliber
    load
    number { 1 }
    distance { 1 }
    distance_unit { 'yd' }
    shots { 1 }
    elevation_adjustment { 1.5 }
    elevation_adjustment_direction { 'up' }
    elevation_adjustment_unit { 'moa' }
    windage_adjustment { 1.5 }
    windage_adjustment_direction { 'left' }
    windage_adjustment_unit { 'moa' }
    wind_speed { 1 }
    wind_speed_unit { 'mph' }
    wind_direction { 1 }
    group_size { 1.5 }
    velocities { [1,2] }
  end
end
