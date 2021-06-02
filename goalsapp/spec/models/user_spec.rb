require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_uniqueness_of(:username) }
    subject(:catcat) { User.create(
      username: "catcat",
      password: "catcatcat"
    )}

  describe "uniqueness" do 
    before :each do
      create(:user)
    end
    
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end


end
