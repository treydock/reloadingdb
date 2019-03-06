require 'rails_helper'

RSpec.describe "loads/new", type: :view do
  before(:each) do
    assign(:load, Load.new(
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

  it "renders new load form" do
    render

    assert_select "form[action=?][method=?]", loads_path, "post" do

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
