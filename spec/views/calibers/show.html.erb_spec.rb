# frozen_string_literal: true

require "rails_helper"

RSpec.describe "calibers/show", type: :view do
  before(:each) do
    @caliber = assign(:caliber, create(:caliber))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@caliber.name)
  end
end
