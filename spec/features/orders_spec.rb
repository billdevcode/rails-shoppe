require 'rails_helper'

RSpec.feature "Orders", type: :feature, js: true do
  describe "shopping cart" do
    let(:user){FactoryGirl.create(:user)}
    let!(:category) {FactoryGirl.create(:category)}
    let(:order) {FactoryGirl.create(:order)}
    before(:each) do
      page.set_rack_session(user_id: user.id)
    end
    it "removes item on click" do
      order
      visit orders_path
      click_on "Remove item"
      wait_for_ajax
      expect(page).not_to have_content("Remove item")
    end

    it "checks out your items" do
      order
      visit orders_path
      click_on "Checkout"
      expect(page).to have_content(order.product.name)
    end

    it "doesn't checkout if cart is empty" do
      visit orders_path
      expect(page).to have_button("Checkout", disabled: true)
    end
  end
end
