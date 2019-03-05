require 'rails_helper'

RSpec.describe "powders/edit", type: :view do
  before(:each) do
    @powder = assign(:powder, Powder.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit powder form" do
    render

    assert_select "form[action=?][method=?]", powder_path(@powder), "post" do

      assert_select "input[name=?]", "powder[name]"

      assert_select "input[name=?]", "powder[user_id]"
    end
  end
end
