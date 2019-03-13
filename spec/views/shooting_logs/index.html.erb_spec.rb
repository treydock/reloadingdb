require 'rails_helper'

RSpec.describe "shooting_logs/index", type: :view do
  before(:each) do
    @shooting_logs = assign(:shooting_logs, create_list(:shooting_log, 2))
  end

  it "renders a list of shooting_logs" do
    render
    assert_select "tr>td", :text => /#{@shooting_logs[0].date}/
    assert_select "tr>td", :text => /#{@shooting_logs[0].time}/
    assert_select "tr>td", :text => /#{@shooting_logs[0].shooting_location.name}/
    assert_select "tr>td", :text => /#{@shooting_logs[1].date}/
    assert_select "tr>td", :text => /#{@shooting_logs[1].time}/
    assert_select "tr>td", :text => /#{@shooting_logs[1].shooting_location.name}/
  end
end
