require 'rails_helper'

RSpec.describe "shooting_velocities/edit", type: :view do
  before(:each) do
    @shooting_velocity = assign(:shooting_velocity, create(:shooting_velocity))
  end

  it "renders the edit shooting_velocity form" do
    render
    assert_select "form[action=?][method=?]", shooting_velocity_path(@shooting_velocity), "post" do
      assert_select "input[name=?]", "shooting_velocity[date]"
      assert_select "select[name=?]", "shooting_velocity[caliber_id]"
      assert_select "select[name=?]", "shooting_velocity[load_id]"
      assert_select "input[name=?]", "shooting_velocity[velocities][]"
      assert_select "select[name=?]", "shooting_velocity[velocity_unit]"
    end
  end
end
