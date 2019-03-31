require 'rails_helper'

RSpec.describe "shooting_groups/new", type: :view do
  before(:each) do
    user = create(:user)
    assign(:shooting_logs, create_list(:shooting_log, 2, user: user))
    assign(:shooting_group, ShootingGroup.new(user: user))
  end

  it "renders new shooting_group form" do
    render

    assert_select "form[action=?][method=?]", shooting_groups_path, "post" do
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
      assert_select "input[name=?]", "shooting_group[velocities][]"
      assert_select "select[name=?]", "shooting_group[velocity_unit]"
    end
  end
end
