require 'rails_helper'

RSpec.describe "loads/edit", type: :view do
  before(:each) do
    @load = assign(:load, Load.create!(
      :caliber => nil,
      :brass => nil,
      :brass_length => "MyString",
      :user => nil,
      :bullet => nil,
      :powder => nil,
      :powder_weight => "MyString",
      :primer => nil,
      :col => "MyString",
      :speed => "MyString"
    ))
  end

  it "renders the edit load form" do
    render

    assert_select "form[action=?][method=?]", load_path(@load), "post" do

      assert_select "input[name=?]", "load[caliber_id]"

      assert_select "input[name=?]", "load[brass_id]"

      assert_select "input[name=?]", "load[brass_length]"

      assert_select "input[name=?]", "load[user_id]"

      assert_select "input[name=?]", "load[bullet_id]"

      assert_select "input[name=?]", "load[powder_id]"

      assert_select "input[name=?]", "load[powder_weight]"

      assert_select "input[name=?]", "load[primer_id]"

      assert_select "input[name=?]", "load[col]"

      assert_select "input[name=?]", "load[speed]"
    end
  end
end
