# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: "home" }
      expect(response).to have_http_status(:success)
    end
  end
end
