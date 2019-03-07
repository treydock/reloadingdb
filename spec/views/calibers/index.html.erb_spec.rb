require 'rails_helper'

RSpec.describe "calibers/index", type: :view do
  before(:each) do
    @calibers = assign(:calibers, create_list(:caliber, 2))
  end

  it "renders a list of calibers" do
    render
    assert_select "tr>td", :text => @calibers[0].name
    assert_select "tr>td", :text => @calibers[1].name
  end
end
