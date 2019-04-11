# frozen_string_literal: true

require "rails_helper"

RSpec.describe "calibers/new", type: :view do
  before(:each) do
    assign(:caliber, Caliber.new(user: create(:user)))
  end

  it "renders new caliber form" do
    render

    assert_select "form[action=?][method=?]", calibers_path, "post" do
      assert_select "input[name=?]", "caliber[name]"
    end
  end
end
