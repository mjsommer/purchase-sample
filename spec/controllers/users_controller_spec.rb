require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do
    it "responds successfully with an HTTP 201 status code" do
      post :create, name: "John Doe", email: "john@example.com"

      expect(response).to be_success
      expect(response).to have_http_status(201)
    end
  end
end
