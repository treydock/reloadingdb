require 'rails_helper'

RSpec.describe "shooting_locations/show", type: :view do
  before(:each) do
    @shooting_location = assign(:shooting_location, create(:shooting_location))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@shooting_location.name)
    expect(rendered).to match(/#{@shooting_location.latitude}/)
    expect(rendered).to match(/#{@shooting_location.longitude}/)
    expect(rendered).to match(/#{@shooting_location.elevation}/)
  end
end
