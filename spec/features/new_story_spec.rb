require 'rails_helper'

describe "creating a story" do

  it "allows a user who enters valid title and content to create a new story" do
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
  end

  it "gives a user an error message if they do not enter a valid story" do
    visit '/sessions/new'
    @user = User.new(:email => 'user@example.com', :password => 'password')
    @user.save
    fill_in :email, :with => 'user@example.com'
    fill_in :password, :with => 'password'
    click_button "Log in"
    visit "/users/#{@user.id}/stories/new"
    fill_in :story_title, :with => ''
    fill_in :story_content, :with => 'new content'
    click_button "Create Story"
    page.should have_content 'invalid'
  end
end
