require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do
    it "routes to home page" do
      expect(:get => "/home").to route_to("pages#show", id: 'home')
    end
    it "routes to about page" do
      expect(:get => "/about").to route_to("pages#show", id: 'about')
    end
  end
end
