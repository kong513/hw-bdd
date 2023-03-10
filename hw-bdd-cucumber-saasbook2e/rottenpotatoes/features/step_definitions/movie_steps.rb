# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # HW4 - part 1
    Movie.create!(title: movie[:title], rating: movie[:rating], release_date: movie[:release_date])
  end
  #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(/[\s\S]*#{e1}[\s\S]*#{e2}/).to match(page.body)
  #fail "Unimplemented"
end

When /I press "(.*)" button/ do |button|
  click_button button
end

Then /I should (not )?see the following movies: "(.*)"/ do |present, movies_list|
  movies = movies_list.split(', ')
  movies.each do |movie|
    if not_present.nil?
      expect(page).to have_content(movie)
    else
      expect(page).not_to have_content(movie)
    end
  end
end






#why erro
#Then /^I should see "([^"]*)"$/ do |text|
  #assert_text(text)
#end









# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #fail "Unimplemented"
  rating_list.split(', ').each do |rating|
    if uncheck
      uncheck "ratings_#{rating}"
    else
      check "ratings_#{rating}"
    end
  end
end

Then(/^I should see the following movies: (.*)$/) do |movie_list|
  movies = movie_list.split(", ")
  movies.each do |movie|
    assert_selector('td', text: movie)
  end
end







Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all('table#movies tbody tr').length
  expect(rows).to eq Movie.count
  #fail "Unimplemented"
end

