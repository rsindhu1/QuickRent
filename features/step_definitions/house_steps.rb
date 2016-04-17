# Add a declarative step here for populating the DB with houses.

Given /the following houses exist/ do |houses_table|
  houses_table.hashes.each do |house|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that house to the database here.
  House.create!(house)
  end
  #fail "Unimplemented"
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  page.body =~ /.#{e1}.*#{e2}/
  #  page.body is the entire content of the page as a string.
  # fail "Unimplemented"
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |title, price|
    house = House.find_by_title(title)
    house.price.should == price
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"


When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the area_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split.each do |rating|
    step %Q{I #{uncheck}check "ratings_#{rating}"}
  end
  # fail "Unimplemented"
end

Then /I should see all the houses/ do
  # Make sure that all the houses in the app are visible in the table
  house_list = House.all.collect! { |house| house.title}
  house_list.each { |title| step %Q{I should see "#{title}"}}
  #fail "Unimplemented"
end

Then /I should (not )?see the following houses: (.*)$/ do |not_see, house_list|
  house_list.split(",").each do |house|
    house = house.gsub(/["']/, '').strip
    if not_see
      expect(page).to_not have_content(house)
    else
      expect(page).to have_content(house)
    end
  end
end