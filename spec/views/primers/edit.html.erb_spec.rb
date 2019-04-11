# frozen_string_literal: true

require "rails_helper"

RSpec.describe "primers/edit", type: :view do
  before(:each) do
    @primer = assign(:primer, create(:primer))
  end

  it "renders the edit primer form" do
    render

    assert_select "form[action=?][method=?]", primer_path(@primer), "post" do
      assert_select "input[name=?]", "primer[name]"
    end
  end
end
