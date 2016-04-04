Given(/^the following users exist:$/) do |user_table|
  # table is a Cucumber::Ast::Table
  # pending # express the regexp above with the code you wish you had
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that house to the database here.
  User.create!(user)
  end
end


When(/^I login using username 'Ankush' and password 'arora'$/) do
 # pending # express the regexp above with the code you wish you had
  login
end

Then(/^login should be successful$/) do
  pending # express the regexp above with the code you wish you had
end