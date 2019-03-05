require "rails_helper"

RSpec.describe CalibersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/calibers").to route_to("calibers#index")
    end

    it "routes to #new" do
      expect(:get => "/calibers/new").to route_to("calibers#new")
    end

    it "routes to #show" do
      expect(:get => "/calibers/1").to route_to("calibers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/calibers/1/edit").to route_to("calibers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/calibers").to route_to("calibers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/calibers/1").to route_to("calibers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/calibers/1").to route_to("calibers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/calibers/1").to route_to("calibers#destroy", :id => "1")
    end
  end
end
