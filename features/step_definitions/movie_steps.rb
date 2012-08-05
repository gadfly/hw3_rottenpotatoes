# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
 	Given %Q{I am on the new movie page}
  	When  %Q{I fill in "Title" with "#{movie[:title]}"}
  	And   %Q{I select "#{movie[:rating]}" from "Rating"}
	And   %Q{I select "#{movie[:release_date].split('-').last}" from "movie_release_date_1i"}
  	And   %Q{I select "#{movie[:release_date].split('-').second}" from "movie_release_date_2i"}
  	And   %Q{I select "#{movie[:release_date].split('-').first}" from "movie_release_date_3i"}
  	And   %Q{I press "Save Changes"}
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end
