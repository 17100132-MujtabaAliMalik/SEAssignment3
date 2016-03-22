# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie) #Added this line to add movie to the database.
  end
  # Removed "flunk "Unimplimented""
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  pagecontent = page.body
  # puts "#{e1}  #{e2}"
  assert pagecontent.index(e1) < pagecontent.index(e2)
  
  
  # flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(",")
  # puts "#{ratings}"
  if (uncheck)
    ratings.each do |rat|
      # step "I uncheck ratings_#{rat.strip}"
      uncheck("ratings_#{rat.strip}")
    end
  else
    ratings.each do |rat|
      # step "I check ratings_#{rat.strip}"
      check("ratings_#{rat.strip}")
    end
  end
  
  # flunk "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all("table#movies tbody tr td[1]").map {|t| t.text} #all the movies
  assert(rows.size == Movie.all.count) #checking if the count of movies equals all the movies
  
  # flunk "Unimplemented"
end
