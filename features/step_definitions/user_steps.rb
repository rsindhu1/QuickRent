Given(/^I am viewing welcome page$/) do
 visit 'houses/welcome'
end

Then(/^page should have the content "([^"]*)"$/) do |arg1|
  text = "Welcome to QuickRent."
  arg1 == text
end

Given(/^I open About Us page$/) do
 visit 'houses/aboutus'
end

Then(/^page should have text "([^"]*)"$/) do |arg1|
  text = "This project will be based on the Online Renting Services through which a lot of people basically for students will have a very centralized way and an easy way of finding houses for various purposes. More deatils: http://www.agileventures.org/projects/quickrent"
  arg1 == text
end


Given(/^the following users exist:$/) do |user_table|
  # table is a Cucumber::Ast::Table
  # pending # express the regexp above with the code you wish you had
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that house to the database here.
  User.create!(user)
  end
end


When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

#When(/^I go to login page$/) do
#  visit '/houses/welcome'
 # pending # express the regexp above with the code you wish you had
  #login
#end

#When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1,arg2|
 # fill_in arg1, with: arg2
#end

#When(/^I fill in password with "([^"]*)"$/) do |arg1|
 # fill_in password with: arg1
#end

Then(/^I should get message "([^"]*)"$/) do |arg1|
  text = "Signed in successfully."
  arg1 == text
  # pending # express the regexp above with the code you wish you had
end