require 'rails_helper'

RSpec.describe "brasses/show", type: :view do
  before(:each) do
    @brass = assign(:brass, Brass.create!(
      :name => "Name",
      :caliber => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
