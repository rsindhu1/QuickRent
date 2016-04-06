require 'spec_helper'
require 'rails_helper'

RSpec.feature 'As a renter, I want to see the list of houses to rent.' do
  scenario "list of houses" do
    visit '/houses/index'
    expect(page).to have_content("House Listings")
  end
end