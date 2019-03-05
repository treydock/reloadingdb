require 'rails_helper'

RSpec.describe "brasses/new", type: :view do
  before(:each) do
    assign(:brass, Brass.new(
      :name => "MyString",
      :caliber => nil,
      :user => nil
    ))
  end

  it "renders new brass form" do
    render

    assert_select "form[action=?][method=?]", brasses_path, "post" do

      assert_select "input[name=?]", "brass[name]"

      assert_select "input[name=?]", "brass[caliber_id]"

      assert_select "input[name=?]", "brass[user_id]"
    end
  end
end
