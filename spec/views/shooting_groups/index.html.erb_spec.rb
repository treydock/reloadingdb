require 'rails_helper'

RSpec.describe "shooting_groups/index", type: :view do
  before(:each) do
    create_list(:shooting_group, 2)
    @shooting_groups = assign(:shooting_groups, ShootingGroup.page(1).all)
  end

  it "renders a list of shooting_groups" do
    render
    assert_select "tr>td", :text => @shooting_groups[0].name
    assert_select "tr>td", :text => @shooting_groups[0].load.name
    assert_select "tr>td", :text => /#{@shooting_groups[0].group_size}/
    assert_select "tr>td", :text => @shooting_groups[1].name
    assert_select "tr>td", :text => @shooting_groups[1].load.name
    assert_select "tr>td", :text => /#{@shooting_groups[1].group_size}/
  end
end
