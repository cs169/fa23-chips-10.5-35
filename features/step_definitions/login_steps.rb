# frozen_string_literal: true

Given /I am on login page$/ do
  log(current_path)
  visit path_to('login')
  log(current_url)
end

When /^I login with (.+)$/ do |provider|
  auth_stuff(provider)
end

Then /^I should be redirected to the (.+) page$/ do |page|
  case page
  when 'home'
    expect(current_path).to eq(root_path)
  when 'user profile'
    assert_equal current_url.path, user_profile_path
  end
end

Given /^I am logged in with (.+)$/ do |provider|
  auth_stuff(provider)
end

def auth_stuff(provider)
  OmniAuth.config.test_mode = true

  fake_user = { uid: '12345', provider: '', first_name: 'Joe', last_name: 'John', email: 'fake@dummy.com' }

  case provider
  when 'Google'
    fake_user[:provider] = 'google_oauth2'
  when 'GitHub'
    fake_user[:provider] = 'github'
  else
    raise 'Invalid authentication provider'
  end

  OmniAuth.config.mock_auth[fake_user[:provider]] = fake_user
  click_button "Sign in with #{provider}"
end
