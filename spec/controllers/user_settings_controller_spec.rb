# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSettingsController, type: :controller do
  login_user

  describe "GET #show" do
    it "returns a success response" do
      get :show
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { default_temperature: "C" }
      }

      it "updates the requested user_setting" do
        put :update, params: { user_settings: new_attributes }
        @current_user.reload
        expect(@current_user.settings(:default_units).temperature).to eq("C")
      end

      it "redirects to the user_setting" do
        put :update, params: { user_settings: new_attributes }
        expect(response).to redirect_to(user_settings_url)
      end
    end
  end
end
