require 'rails_helper'

RSpec.describe "shooting_groups/index", type: :view do
  include LoadViewSpecHelper
  before(:each) do
    initialize_view_helpers(view)
    @shooting_groups = assign(:shooting_groups, create_list(:shooting_group, 2))
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
