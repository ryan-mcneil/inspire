require 'rails_helper'

describe 'A Logged in User' do
  it 'can Log out' do
    user = User.create(email:'user@example.com', password:'password', username:'user')

    visit '/'
    expect(current_path).to eq('/login')

    fill_in :email, with: "user@example.com"
    fill_in :password, with: "password"
    click_on "Login"
    # user = User.create(email:'user@example.com', password:'password', username:'user')
    #
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on "Log Out"

    expect(current_path).to eq("/login")
    expect(page).to have_content("You have successfully logged out")
  end
end
