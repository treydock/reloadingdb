require 'rails_helper'

RSpec.describe "primers/new", type: :view do
  before(:each) do
    assign(:primer, Primer.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new primer form" do
    render

    assert_select "form[action=?][method=?]", primers_path, "post" do

      assert_select "input[name=?]", "primer[name]"

      assert_select "input[name=?]", "primer[user_id]"
    end
  end
end
