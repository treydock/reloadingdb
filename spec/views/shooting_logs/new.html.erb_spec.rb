require 'rails_helper'

RSpec.describe "shooting_logs/new", type: :view do
  before(:each) do
    assign(:shooting_log, ShootingLog.new(user: create(:user)))
  end

  it "renders new shooting_log form" do
    render

    assert_select "form[action=?][method=?]", shooting_logs_path, "post" do
      assert_select "input[name=?]", "shooting_log[date]"
      assert_select "input[name=?]", "shooting_log[time]"
      assert_select "select[name=?]", "shooting_log[shooting_location_id]"
      assert_select "select[name=?]", "shooting_log[caliber_id]"
      assert_select "input[name=?]", "shooting_log[temperature]"
      assert_select "input[name=?]", "shooting_log[pressure]"
      assert_select "input[name=?]", "shooting_log[humidity]"
      assert_select "input[name=?]", "shooting_log[wind_speed]"
      assert_select "input[name=?]", "shooting_log[wind_direction]"
      assert_select "input[name=?]", "shooting_log[angle]"
      assert_select "textarea[name=?]", "shooting_log[conditions]"
      assert_select "textarea[name=?]", "shooting_log[notes]"
    end
  end
end
