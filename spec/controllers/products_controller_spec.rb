require 'rails_helper'


RSpec.describe ProductsController, type: :controller do

  let(:product){Product.create(name: "apple", description: "bundle of bananas", price: 2, remaining_qty: 23, img: "lslslsls") }
  let(:product_class) {Product.create(name: "banana", description: "bundle of bananas", price: 2, remaining_qty: 23, img: "lslslsls")
                        return Product.all}
  let(:params){
    {id: product.id, category: [1], product: {name: "banana", description: "bundle of bananas", price: 2, remaining_qty: 23, img: "lslslsls"}}
  }
  let(:user){FactoryGirl.create(:user)}

  before(:each) do
    session[:user_id] = user.id
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: product
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, id: product
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: product
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a product" do
      post :create, params

      expect(response.content_type).to eq "text/html"
    end
  end

  describe "PATCH #update" do
    it "updates" do
      expect{
        patch(:update, params)
        product.reload
      }.to change(product, :name).to("banana")
    end
  end

  describe "DELETE #destroy" do
    it "deletes a product" do
      expect{
        delete :destroy, id: product_class.first
      }.to change(product_class, :count).by(-1)

    end
  end

end
