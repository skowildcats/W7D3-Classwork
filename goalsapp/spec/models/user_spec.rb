require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "uniqueness" do 
    let!(:user) {create(:user)}
    
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "#is_password" do
    let!(:user) { create(:user) }

    context "Given a valid password" do
      it "Should return true" do
        expect(user.is_password?("password")).to be true
      end
    end

    context "Given a invalid password" do
      it "Should return false" do
        expect(user.is_password?("jeff")).to be false
      end
    end
  end

  describe "password encryption" do
    it "does not save password to the database" do
      create(:twice)
      user = User.find_by(username: "twice")
      expect(user.password).not_to equal("password")
    end

    it "Should encrypt password with BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("BTS")
      
      build(:user, password: "BTS")
    end
  end
end
