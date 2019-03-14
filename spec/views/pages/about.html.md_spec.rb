require 'rails_helper'

RSpec.describe "pages/about.html.md", type: :view do
  it "renders header from markdown" do
    render
    expect(rendered).to match %r{<h3>About</h3>}
  end
end
