require 'rails_helper'

describe 'A user' do
  it 'can delete an interest' do
    user = User.create(email:'user@example.com', password:'password', username:'user')
    i1 = Interest.create(name: 'a song', user: user)
    i2 = Interest.create(name: 'a movie', user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/interests'

    within '.interests' do
      expect(page).to have_content i1.name
      expect(page).to have_content i2.name
    end

    within "#delete-interest-#{i1.id}" do
      click_on "X"
    end

    expect(page).to have_content "#{i1.name.titleize} has been successfully deleted"
    within '.interests' do
      expect(page).to_not have_content i1.name
      expect(page).to have_content i2.name
    end
  end

  it 'can delete an interest' do
    user = User.create(email:'user@example.com', password:'password', username:'user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/interests'

    within '.interests' do
      expect(page).to have_content i1.name
      expect(page).to have_content i2.name
    end

    within "#delete-interest-#{i1.id}" do
      click_on "X"
    end

    expect(page).to have_content "#{i1.name.titleize} has been successfully deleted"
    within '.interests' do
      expect(page).to_not have_content i1.name
      expect(page).to have_content i2.name
    end
  end
end
