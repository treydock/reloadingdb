require 'rails_helper'

RSpec.describe "ShootingGroups", type: :request do
  describe "GET /shooting_groups" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get shooting_groups_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /shooting_groups/next_number' do
    it 'should return next number' do
      user = create(:user)
      shooting_log = create(:shooting_log, user: user)
      load = create(:load, user: user)
      create(:shooting_group, shooting_log: shooting_log, load: load, user: user, distance: 100, number: 1)
      sign_in user
      get next_number_shooting_groups_path, params: {shooting_log_id: shooting_log.id, load_id: load.id, distance: 100}
      expect(response).to have_http_status(200)
      expect(response.body).to eq({next_number: 2}.to_json)
    end
  end
end
