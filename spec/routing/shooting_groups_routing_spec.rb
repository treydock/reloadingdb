# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shooting_groups").to route_to("shooting_groups#index")
    end

    it "routes to #autocomplete" do
      expect(get: "/shooting_groups/autocomplete").to route_to("shooting_groups#autocomplete")
    end

    it "routes to #next_number" do
      expect(get: "/shooting_groups/next_number").to route_to("shooting_groups#next_number")
    end

    it "routes to #new" do
      expect(get: "/shooting_groups/new").to route_to("shooting_groups#new")
    end

    it "routes to #show" do
      expect(get: "/shooting_groups/1").to route_to("shooting_groups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shooting_groups/1/edit").to route_to("shooting_groups#edit", id: "1")
    end

    it "routes to #clone" do
      expect(get: "/shooting_groups/1/clone").to route_to("shooting_groups#clone", id: "1")
    end

    it "routes to #create" do
      expect(post: "/shooting_groups").to route_to("shooting_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shooting_groups/1").to route_to("shooting_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shooting_groups/1").to route_to("shooting_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shooting_groups/1").to route_to("shooting_groups#destroy", id: "1")
    end

    include_examples "discard routing"
  end
end
