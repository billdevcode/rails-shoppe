require 'rails_helper'

describe "add a new category form", type: :feature, js: true do
  let!(:category){ FactoryGirl.create(:category) }
  let(:user){FactoryGirl.create(:user)}
  before(:each) do
    page.set_rack_session(user_id: user.id)
  end

  it "shows all categories on index page" do
    category
    visit root_path
    expect(page).to have_content(category.name)
  end

  it "adds to the shopping cart" do
    visit category_path(category)
    click_button 'Add To Cart'
    wait_for_ajax
    expect(user.orders).not_to be_empty
  end

  it "does not add to cart when remaining_qty is 0" do
    category.products.first.update(remaining_qty: 0)
    visit category_path(category)
    click_button 'Out of stock', disabled: true
    expect(user.orders).to be_empty
  end


  it "creates a new category" do
    visit new_category_path
    within (".new_category") do
      fill_in 'category[name]', with: 'hello'
    end
    click_button 'Create Category'
    expect(page).to have_content 'hello'
  end
end
