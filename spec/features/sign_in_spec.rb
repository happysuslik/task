require 'spec_helper'

describe 'the sign in processing' do
  before(:each) do
    @user = create(:user)
  end

  it 'sign out', js: true do
    sign_in_with(@user.email, @user.password)
    click_link 'Sign out'
    expect(page).to have_content 'Sign up'
  end

  it 'sign me in', js: true do
    sign_in_with(@user.email, @user.password)
    expect(page).to have_content 'All Tasks'
    click_link 'Sign out'
  end

  it 'return to home page', js: true do
    sign_in_with(@user.email, @user.password)
    click_link 'Home'
    expect(page).to have_content 'All Tasks'
  end

end