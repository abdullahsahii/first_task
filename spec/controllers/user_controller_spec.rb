require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "User#create" do
    it "creates a new user and sends an OTP" do
      post :create, params: { user: { email: "user@example.com", password: "password", reenter_password: "password", first_name: "ibexamp", last_name:"example", user_name: "ib12345" } }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["success"]).to be true
      expect(JSON.parse(response.body)["message"]).to eq("OTP sent to your email")
    end
  end
end
