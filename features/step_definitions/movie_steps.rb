# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.

 	#Given %Q{I am on the new movie page}
  	#When  %Q{I fill in "Title" with "#{movie[:title]}"}
  	#And   %Q{I select "#{movie[:rating]}" from "Rating"}
	#And   %Q{I select "#{movie[:release_date].split('-').last}" from "movie_release_date_1i"}
  	#And   %Q{I select "#{movie[:release_date].split('-').second}" from "movie_release_date_2i"}
  	#And   %Q{I select "#{movie[:release_date].split('-').first}" from "movie_release_date_3i"}
  	#And   %Q{I press "Save Changes"}

	Movie.create!(movie)

  end
  assert movies_table.hashes.size == Movie.all.count

end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.

  movies_list = page.all("table#movies tbody tr td[1]").map(&:text)  

  assert movies_list.index(e1) < movies_list.index(e2), "#{e1} not is before #{e2}"

end

Then /^I should see all of the movies$/ do 

  	rows = page.all("table#movies tbody tr td[1]").map! {|t| t.text}
  
  	assert rows.size == Movie.all.count 
end

Then /^I should see no movies$/ do
	rows = page.all("table#movies tbody tr td[1]").map! {|t| t.text}
	
	assert rows.size == 0 
end


Then /^I should see the following ratings: (.*)$/ do |rating_list|

	ratings = page.all("table#movies tbody tr td[2]").map! {|t| t.text}

	rating_list.split(",").each do |field|
		assert ratings.include?(field.strip)
  	end
end
 
Then /^I should not see the following ratings: (.*)$/ do |rating_list|

	ratings = page.all("table#movies tbody tr td[2]").map! {|t| t.text}

	rating_list.split(",").each do |rating|
		assert !ratings.include?(rating.strip)
  	end
end
 
Then /^the director of "(.*?)" should be "(.*?)"$/ do |arg1, arg2|
	movie = Movie.find_by_title arg1 
	assert_equal movie.director, arg2
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
	
	rating_list.split(',').each do |rating|
		if uncheck == "un" then
		   step %Q{I uncheck "ratings_#{rating}"}
       	   step %Q{the "ratings_#{rating}" checkbox should not be checked}
		else
		  step %Q{I check "ratings_#{rating}"}
          step %Q{the "ratings_#{rating}" checkbox should be checked}
		end
	end




end
