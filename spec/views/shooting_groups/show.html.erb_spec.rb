require 'rails_helper'

RSpec.describe "shooting_groups/show", type: :view do
  before(:each) do
    @shooting_group = assign(:shooting_group, create(:shooting_group))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include("#{@shooting_group.shooting_log.date}")
    expect(rendered).to include(@shooting_group.caliber.name)
    expect(rendered).to include(@shooting_group.load.name)
    expect(rendered).to match(/#{@shooting_group.number}/)
    expect(rendered).to include(@shooting_group.distance_full)
    expect(rendered).to include("#{@shooting_group.shots}")
    expect(rendered).to include(@shooting_group.elevation_adjustment_full)
    expect(rendered).to include(@shooting_group.windage_adjustment_full)
    expect(rendered).to include(@shooting_group.wind_speed_full)
    expect(rendered).to include(@shooting_group.group_size_full)
    @shooting_group.velocities.each do |v|
      expect(rendered).to include("#{v} #{@shooting_group.velocity_unit}")
    end
  end
end
