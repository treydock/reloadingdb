require 'rails_helper'

RSpec.describe "loads/show", type: :view do
  before(:each) do
    @load = assign(:load, Load.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Brass Length/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Powder Weight/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Col/)
    expect(rendered).to match(/Speed/)
  end
end
