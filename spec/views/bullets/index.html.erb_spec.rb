require 'rails_helper'

RSpec.describe "bullets/index", type: :view do
  before(:each) do
    assign(:bullets, [
      Bullet.create!(
        :name => "Name",
        :grain => "9.99",
        :caliber => "9.99",
        :user => nil
      ),
      Bullet.create!(
        :name => "Name",
        :grain => "9.99",
        :caliber => "9.99",
        :user => nil
      )
    ])
  end

  it "renders a list of bullets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
