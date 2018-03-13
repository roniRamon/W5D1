require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user validation" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  describe "Encrypt password by using BCrypt gem" do
    it "encrypts the password using BCryp" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: 'Tony',password: 'password')
    end

    it "password is empty" do
      User.create!(username: 'Tony',password: 'password')
      user = User.find_by(username: 'Tony')
      expect(user.password).to be_nil
    end
  end

  describe "token" do
    it "ensures session_token after initialization" do
      user = User.create!(username: 'Tony',password: 'password')
      expect(user.session_token).not_to be_nil
    end
  end'

end
