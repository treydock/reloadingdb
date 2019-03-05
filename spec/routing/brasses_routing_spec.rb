require "rails_helper"

RSpec.describe BrassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/brasses").to route_to("brasses#index")
    end

    it "routes to #new" do
      expect(:get => "/brasses/new").to route_to("brasses#new")
    end

    it "routes to #show" do
      expect(:get => "/brasses/1").to route_to("brasses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/brasses/1/edit").to route_to("brasses#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/brasses").to route_to("brasses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/brasses/1").to route_to("brasses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/brasses/1").to route_to("brasses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/brasses/1").to route_to("brasses#destroy", :id => "1")
    end
  end
end
