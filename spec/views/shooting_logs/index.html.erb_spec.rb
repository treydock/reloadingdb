require 'rails_helper'

RSpec.describe "shooting_logs/index", type: :view do
  include LoadViewSpecHelper
  before(:each) do
    initialize_view_helpers(view)
    create_list(:shooting_log, 2)
    @shooting_logs = assign(:shooting_logs, ShootingLog.page(1).all)
  end

  it "renders a list of shooting_logs" do
    render
    assert_select "tr>td", :text => /#{@shooting_logs[0].date}/
    assert_select "tr>td", :text => /#{@shooting_logs[0].caliber.name}/
    assert_select "tr>td", :text => /#{@shooting_logs[0].shooting_location.name}/
    assert_select "tr>td", :text => /#{@shooting_logs[1].date}/
    assert_select "tr>td", :text => /#{@shooting_logs[1].caliber.name}/
    assert_select "tr>td", :text => /#{@shooting_logs[1].shooting_location.name}/
  end
end
