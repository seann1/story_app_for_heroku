require 'rails_helper'

describe "creating a story" do
  before :each do
  @user = User.create(:email => 'user@example.com', :password => 'password')
  end
  it "allows a user who enters valid title and content to create a new story" do
    visit "stories/new"
    fill_in 'Title', :with => 'new title'
    fill_in 'Content', :with => 'new content'
    click_button "submit"
    page.should have_content 'added'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log in'
    page.should have_content 'invalid'
  end
end
