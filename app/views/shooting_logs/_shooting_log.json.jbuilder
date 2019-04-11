# frozen_string_literal: true

json.extract! shooting_log, :id, :date, :time, :shooting_location_id, :temperature, :pressure, :angle, :conditions, :humidity, :wind_speed, :wind_direction, :notes, :user_id, :created_at, :updated_at
json.url shooting_log_url(shooting_log, format: :json)
