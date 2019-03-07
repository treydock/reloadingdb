require 'rails_helper'

RSpec.describe "primers/show", type: :view do
  before(:each) do
    @primer = assign(:primer, create(:primer))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@primer.name)
  end
end
