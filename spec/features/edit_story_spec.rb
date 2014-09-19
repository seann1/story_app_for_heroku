require 'rails_helper'

describe "Editing a story" do

  it "allows a user who enters valid title and content to edit a story" do
    visit '/sessions/new'
    user = User.new(:email => 'user@example.com', :password => 'password')
    user.save
    fill_in :email, :with => 'user@example.com'
    fill_in :password, :with => 'password'
    click_button "Log in"
    visit "/users/#{user.id}/stories/new"
    story = Story.new(:title => 'new title', :content => 'new content')
    story.save
    fill_in :story_title, :with => 'new title'
    fill_in :story_content, :with => 'new content'
    click_button "Create Story"
    visit "users/#{user.id}/stories/#{story.id}/edit"
    fill_in :story_title, :with => 'newer title'
    fill_in :story_content, :with => 'newer content'
    click_button "Update Story"
    page.should have_content 'story'
    
  end

  it "does not allow a user who enters an invalid title and or content to edit a story" do
    visit '/sessions/new'
    user = User.new(:email => 'user@example.com', :password => 'password')
    user.save
    fill_in :email, :with => 'user@example.com'
    fill_in :password, :with => 'password'
    click_button "Log in"
    visit "/users/#{user.id}/stories/new"
    story = Story.new(:title => 'new title', :content => 'new content')
    story.save
    fill_in :story_title, :with => 'new title'
    fill_in :story_content, :with => 'new content'
    click_button "Create Story"
    visit "users/#{user.id}/stories/#{story.id}/edit"
    fill_in :story_title, :with => ''
    fill_in :story_content, :with => 'newer content'
    click_button "Update Story"
    page.should have_content 'invalid'
    
  end
end
