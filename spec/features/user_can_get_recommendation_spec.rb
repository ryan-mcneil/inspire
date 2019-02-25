require 'rails_helper'

describe 'A user' do
  before :each do
    @user = User.create(email:'user@example.com', password:'password', username:'user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'gets a random recommendation' do
    i1 = Interest.create(name: 'Red Hot Chili Peppers', user: @user)


    stub_request(:get, "https://tastedive.com/api/similar?q=Red Hot Chili Peppers&info=1").
      with(body: {k: ENV['TASTEDIVE_API_KEY']}).
      to_return(body: File.read('spec/fixtures/tastedive.json'))

    visit '/'

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
  it 'gets gives an error if a recommendation isnt found' do
    i1 = Interest.create(name: 'Red Hot', user: @user)


    stub_request(:get, "https://tastedive.com/api/similar?q=Red Hot&info=1").
      with(body: {k: ENV['TASTEDIVE_API_KEY']}).
      to_return(body: File.read('spec/fixtures/tastedive_bad.json'))

    visit '/'

    click_on "Inspire me!"

    within '#recommendation' do
      expect(page).to have_content("Try adding more interests for better recommendations!")
    end

  end
end
