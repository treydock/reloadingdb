require 'rails_helper'

RSpec.describe "brasses/new", type: :view do
  before(:each) do
    assign(:brass, Brass.new)
    assign(:calibers, create_list(:caliber, 2))
  end

  it "renders new brass form" do
    render

    assert_select "form[action=?][method=?]", brasses_path, "post" do
      assert_select "input[name=?]", "brass[name]"
      assert_select "select[name=?]", "brass[caliber_id]"
    end
  end
end
