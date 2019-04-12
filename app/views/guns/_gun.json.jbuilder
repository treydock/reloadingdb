# frozen_string_literal: true

json.extract! gun, :id, :name, :sight_height, :sight_height_unit, :scope_moa_adjustment, :zero_distance, :user_id, :caliber_id, :created_at, :updated_at
json.url gun_url(gun, format: :json)
