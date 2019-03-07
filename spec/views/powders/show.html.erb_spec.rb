require 'rails_helper'

RSpec.describe "powders/show", type: :view do
  before(:each) do
    @powder = assign(:powder, create(:powder))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@powder.name)
  end
end
