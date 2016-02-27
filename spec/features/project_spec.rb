require 'rails_helper'

describe 'Project' do
  before(:each) do
    @user = build(:user)
    @project = build(:project)
  end

  it 'create project', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    expect(page).to have_content @project.title
  end

  it 'edit project', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    find(".projectEdit").click
    fill_in 'input', with: '12345qwerty'
    click_button 'Save'
    expect(page).to have_content '12345qwerty'
  end

  it 'click button Cancel and return to home', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    find(".projectEdit").click
    fill_in 'input', with: '12345dgdfgf'
    click_button 'Cancel'
    expect(page).to have_content @project.title
  end

  it 'destroy project', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    find(".projectDestroy").click
    expect(page).to have_no_content @project.title
  end
end