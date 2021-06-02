require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do

  before :each do
    create(:user)
    visit new_user_url
  end

  scenario 'has a new user page' do 
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("Create new user!")
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'catcat'
      fill_in 'password', with: 'catcatcat'
      click_on 'Submit'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content("Hello catcat")
    end
  end
end

feature 'logging in' do
  before :each do
    visit new_user_url
    fill_in 'username', with: 'catcat'
    fill_in 'password', with: 'catcatcat'
    click_on 'Submit'
    click_on 'Logout'
    visit new_session_url
    fill_in 'username', with: 'catcat'
    fill_in 'password', with: 'catcatcat'
    click_on 'Submit'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("Hello catcat")
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content("Sign Up")
  end
  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_user_url
    fill_in 'username', with: 'catcat'
    fill_in 'password', with: 'catcatcat'
    click_on 'Submit'
    click_on 'Logout'
    visit new_session_url
    fill_in 'username', with: 'catcat'
    fill_in 'password', with: 'catcatcat'
    click_on 'Submit'
    click_on 'Logout'

    expect(page).to_not have_content("Hello catcat")
  end

end