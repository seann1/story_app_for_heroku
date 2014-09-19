require 'rails_helper'

describe "Commenting on a story" do

  it "allows a user who enters valid content to comment on a story" do
    visit '/sessions/new'
    @user = User.new(:email => 'user@example.com', :password => 'password')
    @user.save
    fill_in :email, :with => 'user@example.com'
    fill_in :password, :with => 'password'
    click_button "Log in"
    visit "/users/#{@user.id}/stories/new"
    fill_in :story_title, :with => 'new title'
    fill_in :story_content, :with => 'new content'
    click_button "Create Story"
    page.should have_content 'added'
    @story = Story.new(:title => 'new title', :content => 'new content', :user_id => @user.id, :id => 1)
    @story.save
    visit '/stories/1/comments/new'
    save_and_open_page
    fill_in :comment_content, :with => 'hello'
    click_button 'Create Comment'
    page.should have_content 'added'
  end

  it "allows a user who enters invalid content to comment on a story" do
    visit '/sessions/new'
    @user = User.new(:email => 'user@example.com', :password => 'password')
    @user.save
    fill_in :email, :with => 'user@example.com'
    fill_in :password, :with => 'password'
    click_button "Log in"
    visit "/users/#{@user.id}/stories/new"
    fill_in :story_title, :with => 'new title'
    fill_in :story_content, :with => 'new content'
    click_button "Create Story"
    page.should have_content 'added'
    @story = Story.new(:title => 'new title', :content => 'new content', :user_id => @user.id, :id => 1)
    @story.save
    visit '/stories/1/comments/new'
    save_and_open_page
    fill_in :comment_content, :with => ''
    click_button 'Create Comment'
    page.should have_content 'invalid'
  end


end
