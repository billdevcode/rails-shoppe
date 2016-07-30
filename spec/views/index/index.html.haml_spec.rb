require 'rails_helper'

RSpec.describe "index/index.html.haml", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "displays all the categories" do
    assign(:categories, [
      Category.create!(name: "slicer"),
      Category.create!(name: "dicer")
    ])
    render
    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end

end




