When /^I go to the landing page$/ do
  visit root_path
end

Then /^I should be on the landing page$/ do
  page.should have_content('Bienvenido a instafood')
end
