require 'rails_helper'

RSpec.describe "powders/show", type: :view do
  before(:each) do
    @powder = assign(:powder, Powder.create!(
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
