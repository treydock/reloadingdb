# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Bullets", type: :request do
  describe "GET /bullets" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get bullets_path
      expect(response).to have_http_status(200)
    end
  end
end
