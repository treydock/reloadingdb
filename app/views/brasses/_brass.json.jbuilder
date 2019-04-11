# frozen_string_literal: true

json.extract! brass, :id, :name, :caliber_id, :user_id, :created_at, :updated_at
json.url brass_url(brass, format: :json)
