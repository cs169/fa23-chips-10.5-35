# frozen_string_literal: true

When /I enter (.+) into the search field/ do |address|
  fill_in 'address', with: address
end

Then /I should see a list of (.+) representatives/ do |number|
  expect(page).to have_selector('tr', count: number.to_i + 1)
end

When /^I click on the article of the first representative$/ do
  first(:link, 'News Article').click
  log(current_path)
end

Then /I should get news items for the first representative/ do
  expect(current_path).to eq(representative_news_items_path(3))
end

When /^I click on the name (.+)$/ do |name|
  click_link name
end

Then /^I should see information on (.+)$/ do |name|
  expect(page).to have_content(name)
  case name
  when 'Joseph R. Biden'
    expect(page).to have_content('President of the United States')
    expect(current_path).to eq("#{representative_path(3)}/show")
  end
end

Then /I should navigate to the new news items page for representative id (.+)/ do |id|
  log(current_path)

  expect(current_path).to eq(new_representative_news_item_path(id))
end
