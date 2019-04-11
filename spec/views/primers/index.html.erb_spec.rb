require 'rails_helper'

RSpec.describe "primers/index", type: :view do
  before(:each) do
    create_list(:primer, 2)
    @primers = assign(:primers, Primer.page(1).all)
  end

  it "renders a list of primers" do
    render
    assert_select "tr>td", :text => @primers[0].name
    assert_select "tr>td", :text => @primers[0].name
  end
end
