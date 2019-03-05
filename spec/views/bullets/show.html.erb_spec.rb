require 'rails_helper'

RSpec.describe "bullets/show", type: :view do
  before(:each) do
    @bullet = assign(:bullet, Bullet.create!(
      :name => "Name",
      :grain => "9.99",
      :caliber => "9.99",
      :user => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
