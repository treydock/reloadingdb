require 'rails_helper'

RSpec.describe "ShootingVelocities", type: :request do
  describe "GET /shooting_velocities" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get shooting_velocities_path
      expect(response).to have_http_status(200)
    end
  end
end
