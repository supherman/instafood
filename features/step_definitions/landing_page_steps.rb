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

Given /^There are a menu item$/ do
  MenuItem.create name: 'foo', price: 10
end

When /^I add a menu item to my order$/ do
  within '#combos' do
    find(:css, '.btn-anadir').click
  end
end

When /^I should see the menu item modal$/ do
  sleep 1
  page.evaluate_script("$('#modal-base').is(':visible')").should == true
end

Given /^I am logged in$/ do
  visit user_omniauth_callback_path(:twitter)
end
