require 'rails_helper'

RSpec.describe "Calibers", type: :request do
  describe "GET /calibers" do
    it "works! (now write some real specs)" do
      get calibers_path
      expect(response).to have_http_status(200)
    end
  end
end
