require 'spec_helper'

feature 'User Accounts' do
  scenario 'A user can create an account' do
    visit '/'

    click_link 'Create An Account'
    fill_in 'user[first_name]', with: 'Joe'
    fill_in 'user[last_name]', with: 'Example'
    fill_in 'user[email]', with: 'joe@joe.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content 'Welcome, Joe!'

  end
end