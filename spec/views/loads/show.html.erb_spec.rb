require 'rails_helper'

RSpec.describe "loads/show", type: :view do
  include ActionView::Helpers

  before(:each) do
    @load = assign(:load, create(:load))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@load.date}/)
    expect(rendered).to include(@load.brass.name_caliber)
    expect(rendered).to match(@load.brass_length)
    expect(rendered).to include(@load.bullet.name_grain_caliber)
    expect(rendered).to match(@load.powder.name)
    expect(rendered).to match(@load.powder_weight)
    expect(rendered).to match(@load.primer.name)
    expect(rendered).to match(@load.col)
    expect(rendered).to match(@load.speed)
    expect(rendered).to match(simple_format(@load.notes))
  end
end
