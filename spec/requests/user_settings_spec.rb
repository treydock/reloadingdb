# frozen_string_literal: true

require "rails_helper"

RSpec.describe "UserSettings", type: :request do
  describe "GET /user_settings" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get user_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
