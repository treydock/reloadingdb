require 'rails_helper'

RSpec.describe "ShootingGroups", type: :request do
  describe "GET /shooting_groups" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get shooting_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
