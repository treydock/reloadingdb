require 'rails_helper'

RSpec.describe "shooting_locations/index", type: :view do
  before(:each) do
    create_list(:shooting_location, 2)
    @shooting_locations = assign(:shooting_locations, ShootingLocation.page(1).all)
  end

  it "renders a list of shooting_locations" do
    render
    assert_select "tr>td", :text => @shooting_locations[0].name
    assert_select "tr>td", :text => /#{@shooting_locations[0].latitude}/
    assert_select "tr>td", :text => /#{@shooting_locations[0].longitude}/
    assert_select "tr>td", :text => /#{@shooting_locations[0].elevation}/
    assert_select "tr>td", :text => @shooting_locations[1].name
    assert_select "tr>td", :text => /#{@shooting_locations[1].latitude}/
    assert_select "tr>td", :text => /#{@shooting_locations[1].longitude}/
    assert_select "tr>td", :text => /#{@shooting_locations[1].elevation}/
  end
end
