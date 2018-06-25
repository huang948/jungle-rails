require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      name: "Jordan",
      email: "jordanhuang99@gmail.com",
      password: "123",
      password_confirmation: "123"
    )
  end

  describe 'Validations' do
    it 'should save if all parameters are valid' do
      @user.save
      expect(@user).to be_valid
    end

    it 'should not save if password and password confirmation is different' do
      @user.password_confirmation = "12"
      @user.save
      expect(@user.password).not_to eq(@user.password_confirmation)
    end

    it 'should not save if email is not unique' do
      @user2 = User.new(
        name: "Jason",
        email: "JORDANHUANG99@GMAIL.COM",
        password: "456",
        password_confirmation: "456"
      )
      @user.save
      @user2.save
      expect(@user2).to_not be_valid
    end

    it 'should not save if email is not present' do
      @user.email = nil
      @user.save
      expect(@user).not_to be_valid
    end    

    it 'should not save if email is not present' do
      @user.name = nil
      @user.save
      expect(@user).not_to be_valid
    end      

    it 'should not save if password is less than 3 characters' do
      @user.password = '1'
      @user.password_confirmation = '1'
      @user.save
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate successfully despite spaces before and after email' do
      @user.save
      @user.email = '   jordanhuang99@gmail.com   '
      value = User.authenticate_with_credentials(@user.email, @user.password)
      expect(value).to be_truthy
    end

    it 'should authenticate successfully despite random capitalization' do
      @user.save
      @user.email = 'joRdaNhuaNg99@gMaiL.coM'
      value = User.authenticate_with_credentials(@user.email, @user.password)
      expect(value).to be_truthy
    end

  end

end