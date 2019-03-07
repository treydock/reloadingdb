require 'rails_helper'

RSpec.describe "powders/index", type: :view do
  before(:each) do
    @powders = assign(:powders, create_list(:powder, 2))
  end

  it "renders a list of powders" do
    render
    assert_select "tr>td", :text => @powders[0].name
    assert_select "tr>td", :text => @powders[1].name
  end
end
