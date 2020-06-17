require 'rails_helper'
require 'securerandom'

RSpec.describe User, type: :model do
  let(:michael) { User.new(email: "michael@email.com", password: "Password1", password_confirmation: "Password1") }

  context "basic checks" do
    it 'is valid with proper attributes' do
      expect(michael).to be_valid
    end

    it 'is not valid without an email' do
      michael.email = ''
      expect(michael).not_to be_valid, "Expect User to have an Email"
    end

    it 'is not valid without a password' do
      michael.password = nil
      expect(michael).not_to be_valid, "Expect User to have a Password"
    end
  end

  context "password validations" do
    it 'can\'t have a password shorter than 8 characters' do
      michael.password = SecureRandom.base64(5).gsub(/=+$/,'').to_s
      expect(michael).not_to be_valid, "Expected a password with at least 8 characters, actual length was #{michael.password.length}"
    end

    it 'Password must contain at least 1 uppercase letter' do
      michael.password = "password1"
      expect(michael).not_to be_valid, "Password must have at least 1 uppercase letter"
    end

    it 'Passowrd must contain at least 1 lowercase letter' do
      michael.password = 'PASSWORD1'
      expect(michael).not_to be_valid, "Password must have at least 1 lowercase letter"
    end

    it 'Password must contain at least 1 number' do
      michael.password = "Password"
      expect(michael).not_to be_valid, "Password must have at least 1 number"
    end
  end

  context "email validations" do
    it 'is not able to have duplicate emails' do
      michael.save
      expect(duplicate = User.create(email: michael.email, password: "password")).to_not be_valid, "Users can't have duplicate email addresses"
    end
  end

end