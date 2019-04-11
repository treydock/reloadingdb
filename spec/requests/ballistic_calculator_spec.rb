# frozen_string_literal: true

require "rails_helper"

RSpec.describe "BallisticCalculator", type: :request do
  describe "GET /ballistic_calculator" do
    it "works! (now write some real specs)" do
      sign_in create(:user)
      get ballistic_calculator_path
      expect(response).to have_http_status(200)
    end
  end
end
