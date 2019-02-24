require 'rails_helper'

describe 'A User' do

  before :each do
    user = User.create(email:'user@example.com', password:'password', username:'user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'can create a new interest' do
    visit '/interests'

    fill_in :interest_name, with: "new music"
    click_on "+"

    expect(current_path).to eq '/interests'

    expect(page).to have_content "New Music has been successfully added"
    within '.interests' do
      expect(page).to have_content "new music"
    end
  end

  it 'wont create an interest if a name isnt provided' do
    visit '/interests'

    click_on "+"

    expect(current_path).to eq '/interests'

    expect(page).to have_content "Something went wrong. Try Again"
  end
end
