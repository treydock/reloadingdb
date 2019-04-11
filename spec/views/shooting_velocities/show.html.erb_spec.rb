# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shooting_velocities/show", type: :view do
  before(:each) do
    @shooting_velocity = assign(:shooting_velocity, create(:shooting_velocity))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include("#{@shooting_velocity.date}")
    expect(rendered).to include(@shooting_velocity.caliber.name)
    expect(rendered).to include(@shooting_velocity.load.name)
    expect(rendered).to include("#{@shooting_velocity.average_velocity}")
    @shooting_velocity.velocities.each do |v|
      expect(rendered).to include("#{v} #{@shooting_velocity.velocity_unit}")
    end
  end
end
