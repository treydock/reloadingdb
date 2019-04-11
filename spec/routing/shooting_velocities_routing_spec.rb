require "rails_helper"

RSpec.describe ShootingVelocitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/shooting_velocities").to route_to("shooting_velocities#index")
    end

    it "routes to #autocomplete" do
      expect(get: "/shooting_velocities/autocomplete").to route_to("shooting_velocities#autocomplete")
    end

    it "routes to #new" do
      expect(:get => "/shooting_velocities/new").to route_to("shooting_velocities#new")
    end

    it "routes to #show" do
      expect(:get => "/shooting_velocities/1").to route_to("shooting_velocities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shooting_velocities/1/edit").to route_to("shooting_velocities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shooting_velocities").to route_to("shooting_velocities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shooting_velocities/1").to route_to("shooting_velocities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shooting_velocities/1").to route_to("shooting_velocities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shooting_velocities/1").to route_to("shooting_velocities#destroy", :id => "1")
    end

    include_examples 'discard routing'
  end
end
