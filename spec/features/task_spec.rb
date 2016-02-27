require 'rails_helper'

describe 'Task' do
  before(:each) do
    @user = build(:user)
    @project = build(:project)
    @task = build(:task)
  end

  it 'create task', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    expect(page).to have_content @task.text
  end

  it 'create tasks', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    expect(page).to have_content @task.text
  end

  it 'destroy task', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    find(".taskDestroy").click
    expect(page).to have_no_content @task.text
  end

  it 'edit task', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    find(".taskEdit").click
    fill_in 'input', with: "qwer1"
    click_button 'Save'
    expect(page).to have_content "qwer1"
  end

  it 'click button Cancel and return to home', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    find(".taskEdit").click
    click_button 'Cancel'
    expect(page).to have_content @task.text
  end

end