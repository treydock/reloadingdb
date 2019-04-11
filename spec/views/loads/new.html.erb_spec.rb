# frozen_string_literal: true

require "rails_helper"

RSpec.describe "loads/new", type: :view do
  before(:each) do
    assign(:load, Load.new(user: create(:user)))
  end

  it "renders new load form" do
    render
    assert_select "form[action=?][method=?]", loads_path, "post" do
      assert_select "select[name=?]", "load[caliber_id]"
      assert_select "select[name=?]", "load[brass_id]"
      assert_select "input[name=?]", "load[brass_length]"
      assert_select "select[name=?]", "load[bullet_id]"
      assert_select "select[name=?]", "load[powder_id]"
      assert_select "input[name=?]", "load[powder_weight]"
      assert_select "select[name=?]", "load[primer_id]"
      assert_select "input[name=?]", "load[col]"
      assert_select "input[name=?]", "load[velocity]"
      assert_select "select[name=?]", "load[velocity_unit]"
    end
  end
  it "does not render calculate-velocity" do
    render
    expect(rendered).not_to include('id="calculate-velocity"')
  end
end
