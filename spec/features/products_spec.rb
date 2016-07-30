require 'rails_helper'

RSpec.feature "Products", type: :feature, js: true do

  describe "products" do
    let(:user){FactoryGirl.create(:user)}
    let(:category) {FactoryGirl.create(:category)}
    before(:each) do
      page.set_rack_session(user_id: user.id)
    end
    describe "#new" do
      it "creates a new product" do
        visit new_product_path(category)
        within ('#new_product') do
          fill_in 'product[name]', with: 'bananas'
          fill_in 'product[description]', with: 'a lot of bananas'
          fill_in 'product[price]', with: '6.2'
          fill_in 'product[remaining_qty]', with: '10'
          fill_in 'product[img]', with: 'http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg'
          check "category#{category.id}"
        end
        click_button 'Create Product'
        expect(page).to have_content 'a lot of bananas'
      end
    end

    describe "#show" do
      it "adds to the shopping cart" do
        visit product_path(category.products.first)
        within ('#new_order') do
          fill_in 'order[quantity]', with: '4'
        end
        click_button 'Add To Cart'
        wait_for_ajax
        expect(user.orders).not_to be_empty
      end

      it "does not add to cart when remaining_qty is 0" do
        category.products.first.update(remaining_qty: 0)
        visit product_path(category.products.first)
        within ('#new_order') do
          fill_in 'order[quantity]', with: '4'
        end
        click_button 'Out of stock', disabled: true
        expect(user.orders).to be_empty
      end
    end

    describe "#edit" do
      let!(:product) {FactoryGirl.create(:product)}
      it "edits the product" do
        category
        visit edit_product_path(product)
        expect(page).to have_field("product[name]")
        within ('.edit_product') do
          fill_in 'product[name]', with: 'bananas'
          check "category#{category.id}"
        end
        click_button 'Update Product'
        expect(page).to have_content 'bananas'
      end

    end
  end
end
