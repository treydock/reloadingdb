# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSettingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/settings").to route_to("user_settings#show")
    end

    it "routes to #edit" do
      expect(get: "/users/settings/edit").to route_to("user_settings#edit")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/settings").to route_to("user_settings#update")
    end
  end
end
