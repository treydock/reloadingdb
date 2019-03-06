require 'rails_helper'

RSpec.describe "loads/index", type: :view do
  before(:each) do
    assign(:loads, [
      Load.create!(
        :caliber => nil,
        :brass => nil,
        :brass_length => "Brass Length",
        :user => nil,
        :bullet => nil,
        :powder => nil,
        :powder_weight => "Powder Weight",
        :primer => nil,
        :col => "Col",
        :speed => "Speed"
      ),
      Load.create!(
        :caliber => nil,
        :brass => nil,
        :brass_length => "Brass Length",
        :user => nil,
        :bullet => nil,
        :powder => nil,
        :powder_weight => "Powder Weight",
        :primer => nil,
        :col => "Col",
        :speed => "Speed"
      )
    ])
  end

  it "renders a list of loads" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Brass Length".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Powder Weight".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Col".to_s, :count => 2
    assert_select "tr>td", :text => "Speed".to_s, :count => 2
  end
end
