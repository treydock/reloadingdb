require 'rails_helper'

RSpec.describe "bullets/edit", type: :view do
  before(:each) do
    @bullet = assign(:bullet, Bullet.create!(
      :name => "MyString",
      :grain => 1
    ))
  end

  it "renders the edit bullet form" do
    render

    assert_select "form[action=?][method=?]", bullet_path(@bullet), "post" do

      assert_select "input[name=?]", "bullet[name]"

      assert_select "input[name=?]", "bullet[grain]"
    end
  end
end
