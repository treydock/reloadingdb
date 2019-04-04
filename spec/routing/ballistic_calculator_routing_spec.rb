require "rails_helper"

RSpec.describe BallisticCalculatorController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/ballistic_calculator").to route_to("ballistic_calculator#new")
    end

    it "routes to #create" do
      expect(:post => "/ballistic_calculator").to route_to("ballistic_calculator#create")
    end
  end
end
