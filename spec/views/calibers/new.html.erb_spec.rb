require 'rails_helper'

RSpec.describe "calibers/new", type: :view do
  before(:each) do
    assign(:caliber, Caliber.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new caliber form" do
    render

    assert_select "form[action=?][method=?]", calibers_path, "post" do

      assert_select "input[name=?]", "caliber[name]"

      assert_select "input[name=?]", "caliber[user_id]"
    end
  end
end
