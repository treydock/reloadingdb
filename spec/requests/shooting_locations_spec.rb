# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ShootingLocations", type: :request do
  describe "GET /shooting_locations" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get shooting_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
