require 'rails_helper'

RSpec.describe "bullets/index", type: :view do
  before(:each) do
    assign(:bullets, [
      Bullet.create!(
        :name => "Name",
        :grain => 2
      ),
      Bullet.create!(
        :name => "Name",
        :grain => 2
      )
    ])
  end

  it "renders a list of bullets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
