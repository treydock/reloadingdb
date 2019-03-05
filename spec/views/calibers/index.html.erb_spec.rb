require 'rails_helper'

RSpec.describe "calibers/index", type: :view do
  before(:each) do
    assign(:calibers, [
      Caliber.create!(
        :name => "Name",
        :user => nil
      ),
      Caliber.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of calibers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
