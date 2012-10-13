Given /^I am on the landing page$/ do
  visit root_path
end

When /^I create a new order from the landing page$/ do
  within '#slide' do
    click_link 'PEDIR AHORA'
  end
end

Then /^I should be on the menu page$/ do
  URI.parse(current_url).path.should == menu_path
end

