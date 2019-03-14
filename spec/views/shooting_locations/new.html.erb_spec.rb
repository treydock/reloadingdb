require 'rails_helper'

RSpec.describe "shooting_locations/new", type: :view do
  before(:each) do
    assign(:shooting_location, ShootingLocation.new(user: create(:user)))
  end

  it "renders new shooting_location form" do
    render

    assert_select "form[action=?][method=?]", shooting_locations_path, "post" do
      assert_select "input[name=?]", "shooting_location[name]"
      assert_select "input[name=?]", "shooting_location[latitude]"
      assert_select "input[name=?]", "shooting_location[longitude]"
      assert_select "input[name=?]", "shooting_location[elevation]"
    end
  end
end
