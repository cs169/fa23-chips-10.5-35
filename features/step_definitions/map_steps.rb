# frozen_string_literal: true

# Given /the following states exist/ do |state_table|
#   state_table.hashes.each do |state|
#     State.create(name: state['name'], symbol: state['symbol'], fips_code: state['fips_code'],
#         is_territory: state['is_territory'], lat_min: state['lat_min'], lat_max: state['lat_max'],
#         long_min: state['long_min'], long_max: state['long_max'])
#   end
# end

Then /(.*) seed states should exist/ do |n_seeds|
  expect(State.count).to eq n_seeds.to_i
end

Given /I navigated to (.*) from the map/ do |state|
  log(state_map_path(state))
  visit state_map_path(state)
  log(current_url)
end

When /I click on the list of counties in (.*)/ do |state|
  log(current_path)
  case
    find_button("Counties in #{state}", wait: 10)
  when Capybara::ElementNotFound
    log('Element not found')
  end
  # click_button "Counties in #{state}"
end

Then /I should see a list of counties/ do
  log(page.body)
  find('#actionmap-state-counties-table')
end

When('I click on the county with name {string}') do |string|
  log(string)
end

Then('I should see a list of representatives') do
  pending # Write code here that turns the phrase above into concrete actions
end
