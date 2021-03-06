# frozen_string_literal: true

json.extract! shooting_group, :id, :shooting_log_id, :user_id, :load_id, :number, :distance, :distance_unit, :shots, :elevation_adjustment, :elevation_adjustment_direction, :elevation_adjustment_unit, :windage_adjustment, :windage_adjustment_direction, :windage_adjustment_unit, :wind_speed, :wind_speed_unit, :wind_direction, :group_size, :velocity, :created_at, :updated_at
json.url shooting_group_url(shooting_group, format: :json)
