Given /^I have logged in as "([^"]*)"$/ do |user_name|
  @user = User.find_by_name(user_name)
  cookies[:stub_user_id] = @user.id
end
