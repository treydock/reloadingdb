# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::SessionsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET #sign_in" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #sign_in" do
    it "should sign in user" do
      user = create(:user, email: "test@example.com", username: "test", password: "password", password_confirmation: "password")
      post :create, params: { user: { login: "test", password: "password" } }
      expect(response).to redirect_to(root_url)
      expect(subject.current_user).to eq(user)
    end
    it "should recover and sign in user" do
      user = create(:user, email: "test@example.com", username: "test", password: "password", password_confirmation: "password")
      user.discard
      post :create, params: { user: { login: "test", password: "password" } }
      user.reload
      expect(user.discarded?).to be(false)
      expect(response).to redirect_to(root_url)
      expect(subject.current_user).to eq(user)
    end
    it "should not sign in user" do
      user = create(:user, email: "test@example.com", username: "test", password: "password", password_confirmation: "password")
      post :create, params: { user: { login: "test", password: "password1" } }
      expect(response).not_to redirect_to(root_url)
      expect(subject.current_user).not_to eq(user)
    end
  end
end
