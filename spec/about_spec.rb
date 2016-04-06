require 'spec_helper'
require 'rails_helper'

RSpec.feature 'View About QuickRent' do
  scenario "can view about us page" do

    text = "This project will  be based on the Online Renting Services through which a lot of people basically for students will have a very centralized way and an easy way of finding houses for various purposes. More deatils: http://www.agileventures.org/projects/quickrent"
    visit 'houses/aboutus'
    expect(page).to have_content(text)
  end
end