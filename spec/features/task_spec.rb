require 'spec_helper'

describe 'Task' do
  before(:each) do
    @user = build(:user)
    @task = build(:task)
  end

  it 'create task', js: true do
    sign_in_with(@user.email, @user.password)
    fill_in 'uTask', with: @task.text
    click_button 'Add'
    expect(page).to have_content @task.text
  end

  it 'edit task', js: true do
    sign_in_with(@user.email, @user.password)
    fill_in 'uTask', with: @task.text
    click_button 'Add'
    click_button 'Edit task'
    fill_in 'input', with: '12345qwerty'
    check 'editCheckBox'
    click_button 'Save'
    expect(page).to have_content '12345qwerty'
  end

  it 'click button Cancel and return to home', js: true do
    sign_in_with(@user.email, @user.password)
    fill_in 'uTask', with: @task.text
    click_button 'Add'
    click_button 'Edit task'
    fill_in 'input', with: '12345dgdfgf'
    click_button 'Cancel'
    expect(page).to have_content @task.text
  end

  it 'destroy task', js: true do
    sign_in_with(@user.email, @user.password)
    fill_in 'uTask', with: @task.text
    click_button 'Add'
    click_button 'Destroy'
    expect(page).to have_no_content @task.text
  end
end