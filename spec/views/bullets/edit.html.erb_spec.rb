# frozen_string_literal: true

require "rails_helper"

RSpec.describe "bullets/edit", type: :view do
  before(:each) do
    @bullet = assign(:bullet, create(:bullet))
    assign(:calibers, @bullet.user.calibers)
  end

  it "renders the edit bullet form" do
    render

    assert_select "form[action=?][method=?]", bullet_path(@bullet), "post" do
      assert_select "input[name=?]", "bullet[name]"
      assert_select "input[name=?]", "bullet[grain]"
      assert_select "select[name=?]", "bullet[caliber_id]"
      assert_select "input[name=?]", "bullet[ballistic_coefficient]"
      assert_select "select[name=?]", "bullet[ballistic_coefficient_unit]"
    end
  end
end
