# frozen_string_literal: true

require "rails_helper"

RSpec.describe "user_settings/edit", type: :view do
  before(:each) do
    allow(view).to receive(:current_user) { create(:user) }
  end

  it "renders the edit user_setting form" do
    render

    assert_select "form[action=?][method=?]", user_settings_path, "post" do
      assert_select "input[name=?][value=?]", "_method", "put"
      assert_select "select[name=?]", "user_settings[default_temperature]"
      assert_select "select[name=?]", "user_settings[default_velocity]"
      assert_select "select[name=?]", "user_settings[default_pressure]"
      assert_select "select[name=?]", "user_settings[default_length]"
      assert_select "select[name=?]", "user_settings[default_distance]"
      assert_select "select[name=?]", "user_settings[default_scope_adjustment]"
      assert_select "select[name=?]", "user_settings[default_sort_by]"
      assert_select "select[name=?]", "user_settings[default_sort_direction]"
    end
  end
end
