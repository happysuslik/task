require 'rails_helper'

describe 'the sign in processing' do
  before(:each) do
    @user = create(:user)
    @admin = create(:admin)
  end

  it 'sign out', js: true do
    sign_in_with(@user.email, @user.password)
    click_button 'Sign out'
    expect(page).to have_content 'Sign up'
  end

  it 'sign_in_user', js: true do
    sign_in_with(@user.email, @user.password)
    expect(page).to have_content 'SIMPLE TODO LISTS'
    expect(page).to have_no_content 'Admin panel'
    click_button 'Sign out'
  end

  it 'return to home page', js: true do
    sign_in_with(@user.email, @user.password)
    click_link 'Home'
    expect(page).to have_content 'SIMPLE TODO LISTS'
  end

  context 'visit admin' do
    before do
      sign_in_with(@admin.email, @admin.password)
    end

    it 'sign_in_admin', js: true do
      expect(page).to have_content 'Admin panel'
    end

    it 'visit admin panel', js: true do
      click_link 'Admin panel'
      expect(page).to have_content 'Dashboard'
    end
  end

end