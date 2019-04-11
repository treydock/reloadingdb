# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pages/home.html.md", type: :view do
  it "renders header from markdown" do
    render
    expect(rendered).to match %r{<h1>Home</h1>}
  end
end
