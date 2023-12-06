# frozen_string_literal: true

When /I enter (.+) into the search field/ do |address|
  fill_in 'address', with: address
end

Then /I should see a list of (.+) representatives/ do |number|
  expect(page).to have_selector('tr', count: number.to_i + 1)
end

When /^I click on the artilce of the first representative$/ do
  first(:link, 'News Article').click
end

Then /I should get news items for the first representative/ do
  expect(current_path).to eq(representative_news_items_path(3))
end
