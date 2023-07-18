require 'rails_helper'

RSpec.describe User, type: :model do

  it "password and reenter password same" do
    user = User.new(first_name: "Ibrahim", last_name: "Butt", user_name: "Ibrahim1", email: "ibrahim@gmail.com", password: "12345", reenter_password: "122345" )
    expect(user).to_not be_valid
  end
  it "password and reenter password same" do
    user = User.new(first_name: "Ibrahim", last_name: "Butt", user_name: "Ibrahim1", email: "ibrahim@gmail.com", password: "12345", reenter_password: "12345" )
    expect(user).to be_valid
  end


end


