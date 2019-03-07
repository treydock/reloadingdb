require 'rails_helper'

RSpec.describe "Powders", type: :request do
  describe "GET /powders" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get powders_path
      expect(response).to have_http_status(200)
    end
  end
end
