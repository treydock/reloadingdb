require 'rails_helper'

RSpec.describe "brasses/index", type: :view do
  before(:each) do
    create_list(:brass, 2)
    @brasses = assign(:brasses, Brass.page(1).all)
  end

  it "renders a list of brasses" do
    render
    assert_select "tr>td", :text => @brasses[0].name
    assert_select "tr>td", :text => @brasses[1].name
  end
end
