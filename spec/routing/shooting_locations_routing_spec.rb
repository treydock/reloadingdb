require "rails_helper"

RSpec.describe ShootingLocationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/shooting_locations").to route_to("shooting_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/shooting_locations/new").to route_to("shooting_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/shooting_locations/1").to route_to("shooting_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shooting_locations/1/edit").to route_to("shooting_locations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/shooting_locations").to route_to("shooting_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shooting_locations/1").to route_to("shooting_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shooting_locations/1").to route_to("shooting_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shooting_locations/1").to route_to("shooting_locations#destroy", :id => "1")
    end
  end
end
