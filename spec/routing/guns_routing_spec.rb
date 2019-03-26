require "rails_helper"

RSpec.describe GunsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/guns").to route_to("guns#index")
    end

    it "routes to #new" do
      expect(:get => "/guns/new").to route_to("guns#new")
    end

    it "routes to #show" do
      expect(:get => "/guns/1").to route_to("guns#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guns/1/edit").to route_to("guns#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/guns").to route_to("guns#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/guns/1").to route_to("guns#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/guns/1").to route_to("guns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guns/1").to route_to("guns#destroy", :id => "1")
    end
  end
end
