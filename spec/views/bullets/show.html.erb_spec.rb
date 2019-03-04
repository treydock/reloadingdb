require 'rails_helper'

RSpec.describe "bullets/show", type: :view do
  before(:each) do
    @bullet = assign(:bullet, Bullet.create!(
      :name => "Name",
      :grain => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
