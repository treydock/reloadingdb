require 'rails_helper'

RSpec.describe "shooting_logs/show", type: :view do
  before(:each) do
    @shooting_log = assign(:shooting_log, create(:shooting_log))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@shooting_log.date}/)
    expect(rendered).to match(/#{@shooting_log.time}/)
    expect(rendered).to match(/#{@shooting_log.shooting_location.name}/)
    expect(rendered).to match(/#{@shooting_log.temperature}/)
    expect(rendered).to match(/#{@shooting_log.pressure}/)
    expect(rendered).to match(/#{@shooting_log.humidity}/)
    expect(rendered).to match(/#{@shooting_log.wind_speed}/)
    expect(rendered).to match(/#{@shooting_log.wind_direction}/)
    expect(rendered).to match(/#{@shooting_log.angle}/)
    expect(rendered).to match(/#{@shooting_log.conditions}/)
    expect(rendered).to match(/#{@shooting_log.notes}/)
  end
end
