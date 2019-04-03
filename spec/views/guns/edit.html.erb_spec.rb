require 'rails_helper'

RSpec.describe "guns/edit", type: :view do
  before(:each) do
    @gun = assign(:gun, create(:gun))
  end

  it "renders the edit gun form" do
    render

    assert_select "form[action=?][method=?]", gun_path(@gun), "post" do
      assert_select "input[name=?]", "gun[name]"
      assert_select "select[name=?]", "gun[caliber_id]"
      assert_select "input[name=?]", "gun[sight_height]"
      assert_select "select[name=?]", "gun[sight_height_unit]"
      assert_select "select[name=?]", "gun[scope_moa_adjustment]"
      assert_select "input[name=?]", "gun[zero_distance]"
      assert_select "select[name=?]", "gun[zero_distance_unit]"
    end
  end
end
