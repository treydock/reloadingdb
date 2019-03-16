require 'rails_helper'

RSpec.describe "bullets/show", type: :view do
  before(:each) do
    @bullet = assign(:bullet, create(:bullet))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@bullet.name)
    expect(rendered).to match(/#{@bullet.grain}/)
    expect(rendered).to match(@bullet.caliber.name)
    expect(rendered).to include(@bullet.ballistic_coefficient_full)
  end
end
