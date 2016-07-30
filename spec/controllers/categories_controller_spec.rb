require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category){ Category.create(name: "Animals") }
  let(:category_class) {Category.create(name: "WHAT")
                        return Category.all}
    let(:user){FactoryGirl.create(:user)}

  before(:each) do
    session[:user_id] = user.id
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: category
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #new" do
    it "returns http success" do
      get :new, id: category
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: category
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a category" do
      post :create, { category: { name: "Hello" } }
      expect(response.content_type).to eq "text/html"
    end
  end

  describe "PATCH #update" do
    it "updates" do
      expect{
        patch :update, id: category, category: { name: "NIHAO" }
        category.reload
      }.to change(category, :name).to("NIHAO")
    end
  end

  describe "DELETE #destroy" do
    it "deletes a category" do
      expect{
        delete :destroy, id: category_class.first
      }.to change(category_class, :count).by(-1)

    end
  end

end
