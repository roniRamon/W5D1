# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit '/users/new'
    fill_in 'Username', with: 'user@example.com'
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign Up'
    expect(current_path).to eq(user_path(User.find_by(username: 'user@example.com')))
  end
end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do

      visit '/users/new'
      fill_in 'Username', with: 'user@example.com'
      fill_in 'Password', with: 'abcdef'
      click_button 'Sign Up'
      expect(page).to have_content('user@example.com')
    end

  end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit '/session/new'
    fill_in 'Username', with: 'user@example.com'
    fill_in 'Password', with: 'abcdef'
    click_button 'log In'
    save_and_open_page
    expect(page).to have_content('user@example.com')
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit '/users/index'
    click_button 'Sign Out'
    expect(current_path).to eq(new_session_path)
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit '/session/new'
    expect(page).not_to have_content("user@example.com")
  end

end
