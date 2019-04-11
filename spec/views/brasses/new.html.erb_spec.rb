# frozen_string_literal: true

require "rails_helper"

RSpec.describe "brasses/new", type: :view do
  before(:each) do
    user = create(:user)
    assign(:brass, Brass.new(user: user))
    assign(:calibers, create_list(:caliber, 2, user: user))
  end

  it "renders new brass form" do
    render

    assert_select "form[action=?][method=?]", brasses_path, "post" do
      assert_select "input[name=?]", "brass[name]"
      assert_select "select[name=?]", "brass[caliber_id]"
    end
  end
end
