require 'rails_helper'

describe 'Registration processing' do
  before(:each) do
    @user = build(:user)
  end

  it 'registration user valid', js: true do
    registration_with(@user.email, @user.password, @user.password)
    expect(page).to have_content 'SIMPLE TODO LISTS'
  end

  it 'not registration user and get msg error', js: true do
    registration_with(@user.email, @user.password, "09876543")
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

end