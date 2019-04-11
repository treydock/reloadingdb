# frozen_string_literal: true

json.extract! caliber, :id, :name, :user_id, :created_at, :updated_at
json.url caliber_url(caliber, format: :json)
