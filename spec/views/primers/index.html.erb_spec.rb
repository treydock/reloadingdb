require 'rails_helper'

RSpec.describe "primers/index", type: :view do
  before(:each) do
    assign(:primers, [
      Primer.create!(
        :name => "Name",
        :user => nil
      ),
      Primer.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of primers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
