require 'rails_helper'

RSpec.describe "loads/index", type: :view do
  before(:each) do
    create_list(:load, 2)
    @loads = assign(:loads, Load.page(1).all)
  end

  it "renders a list of loads" do
    allow(view).to receive(:sort_column).and_return('date')
    allow(view).to receive(:sort_direction).and_return('asc')
    render
    assert_select "tr>td", :text => /#{@loads[0].date}/
    assert_select "tr>td", :text => @loads[0].bullet.name_caliber_grain
    assert_select "tr>td", :text => /#{@loads[0].powder.name} - #{@loads[0].powder_weight}/
    assert_select "tr>td", :text => @loads[0].primer.name
    assert_select "tr>td", :text => /#{@loads[1].date}/
    assert_select "tr>td", :text => @loads[1].bullet.name_caliber_grain
    assert_select "tr>td", :text => /#{@loads[1].powder.name} - #{@loads[1].powder_weight}/
    assert_select "tr>td", :text => @loads[1].primer.name
  end
end
