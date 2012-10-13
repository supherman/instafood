When /^I go to the landing page$/ do
  visit root_path
end

Then /^I should be on the landing page$/ do
  page.should have_content('Bienvenido a instafood')
end

Then /^I go to the sign in page$/ do
  visit '/users/auth/twitter'
end

Then /^I should be logged in$/ do
  User.all.size.should eq(1)
end

