require 'rails_helper'

describe 'A visitor' do
  it 'can register with a unique email and password' do
    visit '/'
    expect(current_path).to eq('/login')
    click_on "Register"
    expect(current_path).to eq('/register')

    fill_in :user_email, with: "user@example.com"
    fill_in :user_username, with: "username"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_on "Create Account"

    expect(current_path).to eq('/')
  end

  it 'cannot register with a taken email' do
    user = User.create(email:'user@example.com', password:'1234', username:'user')
    visit '/register'

    fill_in :user_email, with: "user@example.com"
    fill_in :user_username, with: "username"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"

    click_on "Create Account"
    expect(current_path).to eq('/register')
    expect(page).to have_content('Please complete all fields and enter a unique email address')
  end

  it 'cannot register with incorrrect password validation' do
    visit '/register'

    fill_in :user_email, with: "user@example.com"
    fill_in :user_username, with: "username"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "somethingelse"

    click_on "Create Account"
    expect(current_path).to eq('/register')
    expect(page).to have_content('Please complete all fields and enter a unique email address')
  end


end
