require 'rails_helper'

RSpec.describe "brasses/show", type: :view do
  before(:each) do
    @brass = assign(:brass, create(:brass))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@brass.name)
    expect(rendered).to match(@brass.caliber.name)
  end
end
