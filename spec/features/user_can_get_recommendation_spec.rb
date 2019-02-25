require 'rails_helper'

describe 'A user' do
  it 'gets a random recommendation' do
    user = User.create(email:'user@example.com', password:'password', username:'user')
    i1 = Interest.create(name: 'Red Hot Chili Peppers', user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    stub_request(:get, "https://tastedive.com/api/similar?q=Red Hot Chili Peppers&info=1").
      with(body: {k: ENV['TASTEDIVE_API_KEY']}).
      to_return(body: File.read('spec/fixtures/tastedive.json'))

    visit '/'

    # within '#recommendation-name' do
    #   expect(page).to_not have_content("")
    # end

    click_on "Inspire me!"

    within '#recommendation' do
      expect(page).to have_content("How about...")
    end

    within '#recommendation-name' do
      expect(page).to have_content("Foo Fighters")
    end

    within '#recommendation-type' do
      expect(page).to have_content("Type: Music")
    end

    within '#recommendation-teaser' do
      expect(page).to have_content("Foo Fighters is an American rock band, formed in Seattle")
    end

  end
end
