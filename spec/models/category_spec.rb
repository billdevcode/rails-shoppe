require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "with 2 or more categories" do
    it "orders them in reverse chronologically" do
      category = FactoryGirl.create(:category)
      expect(category.reload.products).not_to be_empty
    end
  end
end
