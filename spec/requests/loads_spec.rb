# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Loads", type: :request do
  describe "GET /loads" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get loads_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /loads/:id/calculate_velocity" do
    it "should return calculated velocity" do
      user = create(:user)
      load = create(:load, user: user)
      create(:shooting_velocity, user: user, load: load, velocities: [2000, 2000, 2001])
      create(:shooting_velocity, user: user, load: load, velocities: [2100, 2100])
      sign_in user
      get calculate_velocity_load_path(load, format: :json), headers: headers
      expect(response).to have_http_status(200)
      expect(response.body).to eq({ velocity: 2040 }.to_json)
    end
  end
end
