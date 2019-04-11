# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shooting_velocities/new", type: :view do
  before(:each) do
    user = create(:user)
    assign(:shooting_velocity, ShootingVelocity.new(user: user))
  end

  it "renders new shooting_velocity form" do
    render

    assert_select "form[action=?][method=?]", shooting_velocities_path, "post" do
      assert_select "input[name=?]", "shooting_velocity[date]"
      assert_select "select[name=?]", "shooting_velocity[caliber_id]"
      assert_select "select[name=?]", "shooting_velocity[load_id]"
      assert_select "input[name=?]", "shooting_velocity[velocities][]"
      assert_select "select[name=?]", "shooting_velocity[velocity_unit]"
    end
  end
end
