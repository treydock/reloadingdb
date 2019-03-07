require 'rails_helper'

RSpec.describe "loads/index", type: :view do
  before(:each) do
    @loads = assign(:loads, create_list(:load, 2))
  end

  it "renders a list of loads" do
    render
    assert_select "tr>td", :text => /#{@loads[0].date}/
    assert_select "tr>td", :text => @loads[0].bullet.name_grain_caliber
    assert_select "tr>td", :text => @loads[0].powder.name
    assert_select "tr>td", :text => @loads[0].powder_weight
    assert_select "tr>td", :text => @loads[0].primer.name
    assert_select "tr>td", :text => /#{@loads[1].date}/
    assert_select "tr>td", :text => @loads[1].bullet.name_grain_caliber
    assert_select "tr>td", :text => @loads[1].powder.name
    assert_select "tr>td", :text => @loads[1].powder_weight
    assert_select "tr>td", :text => @loads[1].primer.name
  end
end
