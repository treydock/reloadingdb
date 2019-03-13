json.extract! shooting_location, :id, :name, :latitude, :longitude, :elevation, :user_id, :created_at, :updated_at
json.url shooting_location_url(shooting_location, format: :json)
