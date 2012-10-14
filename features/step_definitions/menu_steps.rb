Given /^I am on the menu page$/ do
  visit menu_path
end

When /^I select a menu item$/ do
  page.find(:css, '.btn-plus').click
end

When /^I add that item to my order$/ do
  wait_until do
    page.evaluate_script("$('#modal-base').is(':visible')") == true
  end

  page.find(:css, '.btn-anadir').click
end

Then /^I should see the menu item in the order description$/ do
  within '.cart' do
    page.should have_content('1 items en tu pedido.')
  end
end

Given /^There are a menu item with variations$/ do
  menu_item = MenuItem.create name: 'Alitas de pollo'
  menu_item.variations.create name: '10 pzaz.', price: 79
  menu_item.variations.create name: '20 pzaz.', price: 145
  menu_item.variations.create name: '30 pzaz.', price: 199
end

When /^I add a variation to my order$/ do
  wait_until do
    page.evaluate_script("$('#modal-base').is(':visible')") == true
  end
  page.find(:css, 'input[name=variation]').click
  page.find(:css, '.btn-anadir').click
end
