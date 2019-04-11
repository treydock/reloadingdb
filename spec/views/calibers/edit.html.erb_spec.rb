# frozen_string_literal: true

require "rails_helper"

RSpec.describe "calibers/edit", type: :view do
  before(:each) do
    @caliber = assign(:caliber, create(:caliber))
  end

  it "renders the edit caliber form" do
    render

    assert_select "form[action=?][method=?]", caliber_path(@caliber), "post" do
      assert_select "input[name=?]", "caliber[name]"
    end
  end
end
