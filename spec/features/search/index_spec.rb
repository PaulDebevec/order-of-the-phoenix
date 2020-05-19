require 'rails_helper'

RSpec.describe 'Welcome screen search' do
  it 'When Gryffindor is selected and I search, I am redirected to /search ' do
    visit '/'
    click_button 'Search For Members'

    expect(current_path).to eq('/search')

    expect(page).to have_content('There are 21 Members Of Gryffindor In The Order of The Phoenix')

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role") # (if it exists)
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus") # (if it exists)
    end
  end
end
