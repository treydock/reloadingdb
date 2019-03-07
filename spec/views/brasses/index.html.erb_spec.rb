require 'rails_helper'

RSpec.describe "brasses/index", type: :view do
  before(:each) do
    @brasses = assign(:brasses, create_list(:brass, 2))
  end

  it "renders a list of brasses" do
    render
    assert_select "tr>td", :text => @brasses[0].name
    assert_select "tr>td", :text => @brasses[1].name
  end
end
