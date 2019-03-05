require 'rails_helper'

RSpec.describe "calibers/edit", type: :view do
  before(:each) do
    @caliber = assign(:caliber, Caliber.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit caliber form" do
    render

    assert_select "form[action=?][method=?]", caliber_path(@caliber), "post" do

      assert_select "input[name=?]", "caliber[name]"

      assert_select "input[name=?]", "caliber[user_id]"
    end
  end
end
