require 'rails_helper'

RSpec.describe "guns/index", type: :view do
  before(:each) do
    @guns = assign(:guns, create_list(:gun, 2))
  end

  it "renders a list of guns" do
    render
    assert_select "tr>td", :text => @guns[0].name
    assert_select "tr>td", :text => @guns[0].caliber.name
    assert_select "tr>td", :text => @guns[1].name
    assert_select "tr>td", :text => @guns[1].caliber.name
  end
end
