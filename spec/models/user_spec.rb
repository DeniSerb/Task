require 'rails_helper'

describe User  do 
  it 'show last_name' do
    user = FactoryGirl.build(:user)  
    expect(user.full_name).to eq("Example User")
   end

  it 'add new last_name' do
    user = FactoryGirl.build(:user)
    user = FactoryGirl.build(:user, :last_name=>"Name")  
    expect(user.full_name).to eq("Example Name")
  end

 context 'valid' do
    subject { FactoryGirl.build(:user) } 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end 
 
  context "password" do
   let(:user) { FactoryGirl.build(:user) }

    it "not valid password" do
      user.password = "Password1"
      user.password_confirmation = "password2"
      user.should_not be_valid
    end

    it "valid password" do
    user.password = "Password1"
    user.password_confirmation = "Password1"
    expect(user).to be_valid  
   end 
  end 

  context "email" do
   let(:user) { FactoryGirl.build(:user) }

    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                      foo@bar_baz.ru foo@bar+baz.ua]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end

    it "should be valid" do
      addresses = %w[user@foo.COM A_b-C@b.ua frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
        end
    end  
  end
end