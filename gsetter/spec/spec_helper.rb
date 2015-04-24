
RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end

def sign_up(username)
  visit new_user_url
  fill_in 'username', :with => username
  fill_in 'password', :with => "password"
  click_on "Create User"
end

def sign_up_as_haley
  sign_up("Haley")
end

def sign_in(username)
  visit new_session_url
  fill_in 'username', :with => username
  fill_in 'password', :with => "password"
  click_on "Sign In"
end

def make_goal(body, privacy = nil)
  visit new_goal_url
  fill_in 'Body', :with => body
  check('Make Private') if privacy == true
  click_on 'Create Goal'
end

def haleys_goals
  sign_up_as_haley
  make_goal("Run!", true)
  make_goal("Swim!", nil)
end

def make_comment(content)
  fill_in 'Comment', :with => content
  click_on('Add Comment')
end
