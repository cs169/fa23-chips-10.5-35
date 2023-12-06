# frozen_string_literal: true

When /^I select the (.+) cycle$/ do |value|
  select(value, from: 'cycle')
end

When /^I select the (.+) category$/ do |value|
  select(value, from: 'category')
end

When /^I click the (.+) button$/ do |button|
  click_button button
end

Then /^I should see the (.+)$/ do |title|
  expect(page).to have_content(title)
end
