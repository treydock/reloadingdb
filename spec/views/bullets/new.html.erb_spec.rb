require 'rails_helper'

RSpec.describe "bullets/new", type: :view do
  before(:each) do
    assign(:bullet, Bullet.new)
    assign(:calibers, create_list(:caliber, 2))
  end

  it "renders new bullet form" do
    render

    assert_select "form[action=?][method=?]", bullets_path, "post" do
      assert_select "input[name=?]", "bullet[name]"
      assert_select "input[name=?]", "bullet[grain]"
      assert_select "select[name=?]", "bullet[caliber_id]"
    end
  end
end
