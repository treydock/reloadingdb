require 'rails_helper'

RSpec.describe "shooting_logs/edit", type: :view do
  before(:each) do
    @shooting_log = assign(:shooting_log, create(:shooting_log))
  end

  it "renders the edit shooting_log form" do
    render

    assert_select "form[action=?][method=?]", shooting_log_path(@shooting_log), "post" do
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
