# frozen_string_literal: true

json.extract! load, :id, :caliber_id, :brass_id, :brass_length, :date, :user_id, :bullet_id, :bullet, :powder_id, :powder_weight, :primer_id, :col, :velocity, :created_at, :updated_at
json.url load_url(load, format: :json)
