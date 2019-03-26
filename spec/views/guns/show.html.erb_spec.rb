require 'rails_helper'

RSpec.describe "guns/show", type: :view do
  before(:each) do
    @gun = assign(:gun, create(:gun))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@gun.name}/)
    expect(rendered).to match(/#{@gun.caliber.name}/)
    expect(rendered).to match(/#{@gun.sight_height_full}/)
    expect(rendered).to match(/#{@gun.zero_distance_full}/)
  end
end
