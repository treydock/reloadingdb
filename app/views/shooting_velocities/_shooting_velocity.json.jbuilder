# frozen_string_literal: true

json.extract! shooting_velocity, :id, :date, :velocities, :user_id, :load_id, :created_at, :updated_at
json.url shooting_velocity_url(shooting_velocity, format: :json)
