require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:params){{user: {username: "banana", email: "bananas@gmail.com", password_hash: "hey"}}}
    it "creates a user" do
      post :create, params
      expect(response).to have_http_status(:redirect)
    end
  end
end
