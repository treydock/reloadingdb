require 'rails_helper'

RSpec.describe "brasses/edit", type: :view do
  before(:each) do
    @brass = assign(:brass, create(:brass))
    assign(:calibers, @brass.user.calibers)
  end

  it "renders the edit brass form" do
    render

    assert_select "form[action=?][method=?]", brass_path(@brass), "post" do
      assert_select "input[name=?]", "brass[name]"
      assert_select "select[name=?]", "brass[caliber_id]"
    end
  end
end
