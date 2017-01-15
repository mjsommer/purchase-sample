require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe "POST create" do
    it "responds successfully with an HTTP 201 status code" do
      user = FactoryGirl.create(:user)
      post :create, user_id: user.id, purchased_at: "REI", status: "completed"

      expect(response).to be_success
      expect(response).to have_http_status(201)
    end
  end

  describe "GET show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: 1, limit: "name"

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end

