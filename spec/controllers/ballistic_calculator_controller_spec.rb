# frozen_string_literal: true

require "rails_helper"

RSpec.describe BallisticCalculatorController, type: :controller do
  login_user

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "returns a success response" do
      post :create, params: { ballistic_calculator: attributes_for(:ballistic_calculator) }
      expect(response).to be_successful
    end
  end
end
