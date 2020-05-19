require 'rails_helper'

RSpec.describe 'As a visitor who visits the welcome page' do
  it "I see a dropdown menu" do
    visit '/'
    expect(page).to have_content("The Order of The Phoenix")
    expect(page).to have_content("Search For Members of The Order of The Phoenix By House")
    expect(page).to have_button("Search For Members")
  end
end
