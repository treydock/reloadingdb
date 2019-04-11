require 'rails_helper'

RSpec.describe "shooting_velocities/index", type: :view do
  before(:each) do
    create_list(:shooting_velocity, 2)
    @shooting_velocities = assign(:shooting_velocitys, ShootingVelocity.page(1).all)
  end

  it "renders a list of shooting_velocities" do
    render
    assert_select "tr>td", :text => /#{@shooting_velocities[0].date}/
    assert_select "tr>td", :text => @shooting_velocities[0].load.name
    assert_select "tr>td", :text => /#{@shooting_velocities[0].average_velocity}/
    assert_select "tr>td", :text => /#{@shooting_velocities[1].date}/
    assert_select "tr>td", :text => @shooting_velocities[1].load.name
    assert_select "tr>td", :text => /#{@shooting_velocities[1].average_velocity}/
  end
end
