require 'rails_helper'

RSpec.describe "loads/edit", type: :view do
  before(:each) do
    @load = assign(:load, create(:load))
    assign(:calibers, @load.user.calibers)
    assign(:brasses, @load.user.brasses)
    assign(:bullets, @load.user.bullets)
    assign(:powders, @load.user.powders)
    assign(:primers, @load.user.primers)
  end

  it "renders the edit load form" do
    render

    assert_select "form[action=?][method=?]", load_path(@load), "post" do
      assert_select "input[name=?]", "load[date]"
      assert_select "select[name=?]", "load[caliber_id]"
      assert_select "select[name=?]", "load[brass_id]"
      assert_select "input[name=?]", "load[brass_length]"
      assert_select "select[name=?]", "load[bullet_id]"
      assert_select "select[name=?]", "load[powder_id]"
      assert_select "input[name=?]", "load[powder_weight]"
      assert_select "select[name=?]", "load[primer_id]"
      assert_select "input[name=?]", "load[col]"
      assert_select "input[name=?]", "load[speed]"
    end
  end
end
