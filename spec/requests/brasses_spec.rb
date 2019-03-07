require 'rails_helper'

RSpec.describe "Brasses", type: :request do
  describe "GET /brasses" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get brasses_path
      expect(response).to have_http_status(200)
    end
  end
end
