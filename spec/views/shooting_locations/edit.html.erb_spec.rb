# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shooting_locations/edit", type: :view do
  before(:each) do
    @shooting_location = assign(:shooting_location, create(:shooting_location))
  end

  it "renders the edit shooting_location form" do
    render

    assert_select "form[action=?][method=?]", shooting_location_path(@shooting_location), "post" do
      assert_select "input[name=?]", "shooting_location[name]"
      assert_select "input[name=?]", "shooting_location[latitude]"
      assert_select "input[name=?]", "shooting_location[longitude]"
      assert_select "input[name=?]", "shooting_location[elevation]"
    end
  end
end
