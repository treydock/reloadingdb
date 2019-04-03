require 'rails_helper'

RSpec.describe "guns/new", type: :view do
  before(:each) do
    user = create(:user)
    assign(:gun, Gun.new(user: user))
    assign(:calibers, create_list(:caliber, 2, user: user))
  end

  it "renders new gun form" do
    render

    assert_select "form[action=?][method=?]", guns_path, "post" do
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
