require 'rails_helper'

describe 'A visitor' do
  it 'can register with a unique email and password' do
    visit '/'
    expect(current_path).to eq('/login')
    click_on "Register"
    expect(current_path).to eq('/register')

    fill_in :email, with: "user@example.com"
    fill_in :password, with: "password"
    fill_in :password_confirmation, with: "password"
    click_on "Create Account"

    expect(current_path).to eq('/')
  end
end
