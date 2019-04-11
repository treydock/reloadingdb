# frozen_string_literal: true

require "rails_helper"

RSpec.describe BulletsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bullets").to route_to("bullets#index")
    end

    it "routes to #new" do
      expect(get: "/bullets/new").to route_to("bullets#new")
    end

    it "routes to #show" do
      expect(get: "/bullets/1").to route_to("bullets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/bullets/1/edit").to route_to("bullets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bullets").to route_to("bullets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bullets/1").to route_to("bullets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bullets/1").to route_to("bullets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bullets/1").to route_to("bullets#destroy", id: "1")
    end

    include_examples "discard routing"
  end
end
