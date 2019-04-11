# frozen_string_literal: true

require "rails_helper"

RSpec.describe "loads/show", type: :view do
  include ActionView::Helpers

  before(:each) do
    @load = assign(:load, create(:load))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@load.date}/)
    expect(rendered).to include(@load.brass.name_caliber)
    expect(rendered).to include(@load.brass_length_full)
    expect(rendered).to include(@load.bullet.name_caliber_grain)
    expect(rendered).to match(@load.powder.name)
    expect(rendered).to match(/#{@load.powder_weight}/)
    expect(rendered).to match(@load.primer.name)
    expect(rendered).to include("#{@load.col_full}")
    expect(rendered).to include("#{@load.run_out_full}")
    expect(rendered).to include("#{@load.velocity_full}")
    expect(rendered).to match(simple_format(@load.notes))
  end
end
