require 'rails_helper'

RSpec.describe "brasses/edit", type: :view do
  before(:each) do
    @brass = assign(:brass, Brass.create!(
      :name => "MyString",
      :caliber => nil,
      :user => nil
    ))
  end

  it "renders the edit brass form" do
    render

    assert_select "form[action=?][method=?]", brass_path(@brass), "post" do

      assert_select "input[name=?]", "brass[name]"

      assert_select "input[name=?]", "brass[caliber_id]"

      assert_select "input[name=?]", "brass[user_id]"
    end
  end
end
