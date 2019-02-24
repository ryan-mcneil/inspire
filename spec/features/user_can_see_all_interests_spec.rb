require 'rails_helper'

describe 'A User' do
  it 'sees a list of all interests' do
    user = User.create(email:'user@example.com', password:'password', username:'user')
    i1 = Interest.create(name: 'a song', user: user)
    i2 = Interest.create(name: 'a movie', user: user)
    i3 = Interest.create(name: 'an artist', user: user)
    i4 = Interest.create(name: 'a different song')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on 'My Interests'
    expect(current_path).to eq('/interests')

    expect(page).to have_content "My Interests"
    within '#interests' do
      expect(page).to have_content i1.name
      expect(page).to have_content i2.name
      expect(page).to have_content i3.name
      expect(page).to_not have_content i4.name
    end
  end
end
