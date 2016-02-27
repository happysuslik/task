require 'rails_helper'

describe 'Comment' do
  before(:each) do
    @user = build(:user)
    @project = build(:project)
    @task = build(:task)
    @comment = build(:comment)
  end

  it 'create comment', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    find(".taskEdit").click
    fill_in 'descriptionF', with: @comment.description
    click_button 'Add a comment'
    expect(page).to have_content @comment.description
  end

  it 'destroy comment', js: true do
    registration_with(@user.email, @user.password, @user.password)
    fill_in 'uProject', with: @project.title
    click_button 'Add Project'
    fill_in 'uTask', with: @task.text
    click_button 'Add Task'
    find(".taskEdit").click
    fill_in 'descriptionF', with: @comment.description
    click_button 'Add a comment'
    find('.destroyComment').click
    expect(page).to have_no_content @comment.description
  end

end