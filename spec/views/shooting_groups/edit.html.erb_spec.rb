require 'rails_helper'

RSpec.describe "shooting_groups/edit", type: :view do
  before(:each) do
    @shooting_logs = assign(:shooting_logs, create_list(:shooting_log, 2))
    @loads = assign(:loads, create_list(:load, 2))
    @shooting_group = assign(:shooting_group, create(:shooting_group))
  end

  it "renders the edit shooting_group form" do
    render

    assert_select "form[action=?][method=?]", shooting_group_path(@shooting_group), "post" do
      assert_select "select[name=?]", "shooting_group[shooting_log_id]"
      assert_select "select[name=?]", "shooting_group[caliber_id]"
      assert_select "select[name=?]", "shooting_group[load_id]"
      assert_select "input[name=?]", "shooting_group[number]"
      assert_select "input[name=?]", "shooting_group[distance]"
      assert_select "select[name=?]", "shooting_group[distance_unit]"
      assert_select "input[name=?]", "shooting_group[shots]"
      assert_select "input[name=?]", "shooting_group[elevation_adjustment]"
      assert_select "select[name=?]", "shooting_group[elevation_adjustment_unit]"
      assert_select "select[name=?]", "shooting_group[elevation_adjustment_direction]"
      assert_select "input[name=?]", "shooting_group[windage_adjustment]"
      assert_select "select[name=?]", "shooting_group[windage_adjustment_unit]"
      assert_select "select[name=?]", "shooting_group[windage_adjustment_direction]"
      assert_select "input[name=?]", "shooting_group[wind_speed]"
      assert_select "input[name=?]", "shooting_group[wind_direction]"
      assert_select "select[name=?]", "shooting_group[wind_speed_unit]"
      assert_select "input[name=?]", "shooting_group[group_size]"
      assert_select "select[name=?]", "shooting_group[group_size_unit]"
    end
  end
end
