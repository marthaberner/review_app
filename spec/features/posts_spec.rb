require 'spec_helper'

feature 'Posts' do
  scenario 'A registered user can create a post' do
    visit '/'

    click_link 'Create An Account'
    fill_in 'user[first_name]', with: 'Joe'
    fill_in 'user[last_name]', with: 'Example'
    fill_in 'user[email]', with: 'joe@joe.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content 'Welcome, Joe!'

    click_link 'Write A Post'
    expect(page).to have_no_link 'Write A Post'

    fill_in 'post[body]', with: 'Loving my new bike!'
    click_on 'Submit Post'

    expect(page).to have_content 'Loving my new bike!'

    #User can only see their own posts

    click_link 'Logout'
    create_user

    click_link 'Login'
    fill_in 'session[email]', with: 'sue@sue.com'
    fill_in 'session[password]', with: 'password'
    click_on 'Login'

    expect(page).to have_content 'Welcome, Sue!'

    click_link 'Write A Post'
    fill_in 'post[body]', with: 'Sue Post'
    click_on 'Submit Post'

    expect(page).to have_content 'Sue Post'
    expect(page).to have_no_content 'Loving my new bike!'
  end
end
