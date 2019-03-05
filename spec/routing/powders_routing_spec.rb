require "rails_helper"

RSpec.describe PowdersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/powders").to route_to("powders#index")
    end

    it "routes to #new" do
      expect(:get => "/powders/new").to route_to("powders#new")
    end

    it "routes to #show" do
      expect(:get => "/powders/1").to route_to("powders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/powders/1/edit").to route_to("powders#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/powders").to route_to("powders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/powders/1").to route_to("powders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/powders/1").to route_to("powders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/powders/1").to route_to("powders#destroy", :id => "1")
    end
  end
end
