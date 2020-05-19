# As a user,
# When I visit "/"
# And I Select “Gryffindor” from the select field
# (Note: Use the existing select field)
# And I click "Search For Members“
# Then I should be on page “/search”

# Then I should see the total number of the order of the phoenix members that belong to Gryffindor. (i.e. 21)
# And I should see a list with the detailed information for the 21 members of the Order of the Phoenix for house Gryffindor.
# ​
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)

require 'rails_helper'

RSpec.describe 'As a visitor who visits the welcome page' do
  it "I see a dropdown menu" do
    visit '/'
    expect(page).to have_content("The Order of The Phoenix")
    expect(page).to have_content("Search For Members of The Order of The Phoenix By House")
    expect(page).to have_button("Search For Members")
  end

  it 'When I select Gryffindor from the select field I am redirected to /search ' do
    visit '/'
    click_button 'Search For Members'

    expect(current_path).to eq('/search')

    expect(page).to have_content('21 Members')

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role") # (if it exists)
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus") # (if it exists)
    end
  end
end
