require 'rails_helper'

RSpec.describe "brasses/index", type: :view do
  before(:each) do
    assign(:brasses, [
      Brass.create!(
        :name => "Name",
        :caliber => nil,
        :user => nil
      ),
      Brass.create!(
        :name => "Name",
        :caliber => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of brasses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
