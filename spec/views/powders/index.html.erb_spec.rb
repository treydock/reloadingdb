# frozen_string_literal: true

require "rails_helper"

RSpec.describe "powders/index", type: :view do
  before(:each) do
    create_list(:powder, 2)
    @powders = assign(:powders, Powder.page(1).all)
  end

  it "renders a list of powders" do
    render
    assert_select "tr>td", text: @powders[0].name
    assert_select "tr>td", text: @powders[1].name
  end
end
