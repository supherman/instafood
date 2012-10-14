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

Then /^I should see the twitter sign in modal$/ do
  page.should have_content('Accede para hacer tu pedido')
end

Given /^There are menu items$/ do
  MenuItem.create name: 'foo'
end

When /^I add a menu item to my order$/ do
  within '#combos' do
    find(:css, '.btn-anadir').click
  end
end
