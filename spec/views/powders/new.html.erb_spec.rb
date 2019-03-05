require 'rails_helper'

RSpec.describe "powders/new", type: :view do
  before(:each) do
    assign(:powder, Powder.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new powder form" do
    render

    assert_select "form[action=?][method=?]", powders_path, "post" do

      assert_select "input[name=?]", "powder[name]"

      assert_select "input[name=?]", "powder[user_id]"
    end
  end
end
