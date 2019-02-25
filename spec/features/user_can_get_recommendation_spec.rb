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
      expect(page).to have_content("Foo Fighters is an American rock band, formed in Seattle, Washington, in 1994. It was founded by Nirvana drummer Dave Grohl as a one-man project following the dissolution of Nirvana after the suicide of Kurt Cobain. The group got its name from the UFOs and various aerial phenomena that were reported by Allied aircraft pilots in World War II, which were known collectively as \"foo fighters\".\nPrior to the release of Foo Fighters' 1995 debut album Foo Fighters, which featured Grohl")
    end

  end
end
