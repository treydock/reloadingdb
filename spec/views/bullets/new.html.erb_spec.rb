require 'rails_helper'

RSpec.describe "bullets/new", type: :view do
  before(:each) do
    assign(:bullet, Bullet.new(
      :name => "MyString",
      :grain => "9.99",
      :caliber => "9.99",
      :user => nil
    ))
  end

  it "renders new bullet form" do
    render

    assert_select "form[action=?][method=?]", bullets_path, "post" do

      assert_select "input[name=?]", "bullet[name]"

      assert_select "input[name=?]", "bullet[grain]"

      assert_select "input[name=?]", "bullet[caliber]"

      assert_select "input[name=?]", "bullet[user_id]"
    end
  end
end
