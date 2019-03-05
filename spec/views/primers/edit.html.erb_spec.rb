require 'rails_helper'

RSpec.describe "primers/edit", type: :view do
  before(:each) do
    @primer = assign(:primer, Primer.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit primer form" do
    render

    assert_select "form[action=?][method=?]", primer_path(@primer), "post" do

      assert_select "input[name=?]", "primer[name]"

      assert_select "input[name=?]", "primer[user_id]"
    end
  end
end
