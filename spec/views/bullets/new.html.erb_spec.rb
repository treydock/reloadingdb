require 'rails_helper'

RSpec.describe "bullets/new", type: :view do
  before(:each) do
    assign(:bullet, Bullet.new(
      :name => "MyString",
      :grain => 1
    ))
  end

  it "renders new bullet form" do
    render

    assert_select "form[action=?][method=?]", bullets_path, "post" do

      assert_select "input[name=?]", "bullet[name]"

      assert_select "input[name=?]", "bullet[grain]"
    end
  end
end
