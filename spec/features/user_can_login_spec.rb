require 'rails_helper'

describe 'a registered user' do
  it 'can login with correct credentials' do
    user = User.create(email:'user@example.com', password:'password', username:'user')

    visit '/'
    expect(current_path).to eq('/login')

    fill_in :email, with: "user@example.com"
    fill_in :password, with: "password"
    click_on "Login"

    expect(current_path).to eq('/')

    expect(page).to have_content("Hi, #{user.username}!")
    expect(page).to have_button("Inspire me!")
    expect(page).to have_link("My Interests")

  end

  it 'can not login with incorrect credentials' do
    user = User.create(email:'user@example.com', password:'password', username:'user')

    visit '/'
    expect(current_path).to eq('/login')

    fill_in :email, with: "user@example.com"
    fill_in :password, with: "wrongpassword"
    click_on "Login"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Password does not match username. Please try again.")

  end
end
