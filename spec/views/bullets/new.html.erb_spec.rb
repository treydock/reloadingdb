require 'rails_helper'

RSpec.describe "bullets/new", type: :view do
  before(:each) do
    user = create(:user)
    assign(:bullet, Bullet.new(user: user))
    assign(:calibers, create_list(:caliber, 2, user: user))
  end

  it "renders new bullet form" do
    render

    assert_select "form[action=?][method=?]", bullets_path, "post" do
      assert_select "input[name=?]", "bullet[name]"
      assert_select "input[name=?]", "bullet[grain]"
      assert_select "select[name=?]", "bullet[caliber_id]"
      assert_select "input[name=?]", "bullet[ballistic_coefficient]"
      assert_select "select[name=?]", "bullet[ballistic_coefficient_unit]"
    end
  end
end
