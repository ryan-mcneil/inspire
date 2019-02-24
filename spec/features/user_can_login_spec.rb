require 'rails_helper'

describe 'a registered user' do
  'can login with correct credentials' do
    user = User.create(email:'user@example.com', password:'1234', username:'user')

    visit '/'
    expect(current_path).to eq('/login')

    fill_in :user_email, with: "user@example.com"
    fill_in :user_password, with: "password"
    click_on "Login"

    expect(current_path).to eq('/')

    expect(page).to have_content("Hi, #{user.username}!")
    expect(page).to have_button("Inspire me")
    expect(page).to have_button("My Interests")

  end
end
