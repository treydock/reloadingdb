require 'rails_helper'

RSpec.describe "bullets/index", type: :view do
  before(:each) do
    @bullets = assign(:bullets, create_list(:bullet, 2))
  end

  it "renders a list of bullets" do
    render
    assert_select "tr>td", :text => @bullets[0].name
    assert_select "tr>td", :text => @bullets[1].name
  end
end
