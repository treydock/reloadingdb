# frozen_string_literal: true

require "rails_helper"

RSpec.describe "powders/edit", type: :view do
  before(:each) do
    @powder = assign(:powder, create(:powder))
  end

  it "renders the edit powder form" do
    render

    assert_select "form[action=?][method=?]", powder_path(@powder), "post" do
      assert_select "input[name=?]", "powder[name]"
    end
  end
end
