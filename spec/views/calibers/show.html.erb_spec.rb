require 'rails_helper'

RSpec.describe "calibers/show", type: :view do
  before(:each) do
    @caliber = assign(:caliber, Caliber.create!(
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
