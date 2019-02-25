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
    expect(page).to have_link("Inspire me!")
    expect(page).to have_link("My Interests")

  end

  it 'can not login with incorrect email' do
    user = User.create(email:'user@example.com', password:'password', username:'user')

    visit '/'
    expect(current_path).to eq('/login')

    fill_in :email, with: "wrong@example.com"
    fill_in :password, with: "wrongpassword"
    click_on "Login"

    expect(current_path).to eq('/login')
    expect(page).to have_content("Password does not match username. Please try again.")
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

describe 'A logged in user' do

  before :each do
    user = User.create(email:'user@example.com', password:'password', username:'user')

    visit '/login'
    fill_in :email, with: "user@example.com"
    fill_in :password, with: "password"
    click_on "Login"
  end

  it 'cannot visit login path' do
    visit '/login'
    expect(current_path).to eq('/')
    expect(page).to have_content("You are already logged in")
  end

  it 'cannot visit register path' do
    visit '/register'
    expect(current_path).to eq('/')
    expect(page).to have_content("You are already logged in")
  end
end

describe 'An unauthenticated user' do

  it 'cannot visit root path' do
    visit '/'
    expect(current_path).to eq('/login')
    expect(page).to have_content("You must log in first")
  end

  it 'cannot visit interests' do
    visit '/interests'
    expect(current_path).to eq('/login')
    expect(page).to have_content("You must log in first")
  end

end
