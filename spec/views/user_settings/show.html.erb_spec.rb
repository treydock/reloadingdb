# frozen_string_literal: true

require "rails_helper"

RSpec.describe "user_settings/show", type: :view do
  before(:each) do
    allow(view).to receive(:current_user) { create(:user) }
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(view.current_user.settings(:default_units).temperature)
    expect(rendered).to match(view.current_user.settings(:default_units).velocity)
    expect(rendered).to match(view.current_user.settings(:default_units).pressure)
    expect(rendered).to match(view.current_user.settings(:default_units).length)
    expect(rendered).to match(view.current_user.settings(:default_units).distance)
    expect(rendered).to match(view.current_user.settings(:default_units).scope_adjustment)
    expect(rendered).to match(view.current_user.settings(:interface).sort_by)
    expect(rendered).to match(view.current_user.settings(:interface).sort_direction)
  end
end
