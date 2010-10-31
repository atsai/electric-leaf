Given /^I have logged in as "([^"]*)"$/ do |user_name|
  @user = User.find_by_name(user_name)
  cookies[:stub_user_id] = @user.id
end

Given /^I have added chore "([^"]*)" for "([^"]*)" with deadline "([^"]*)"$/ do |chore_title, user_name, deadline|
  @user = User.find_by_name(user_name)
  Chore.create!(:title => chore_title, :description => "", :deadline => Time.parse(deadline), 
    :is_recurring => false, :is_rotating => false, :is_done => false, :residence_id => @user.residence.id,
    :user_ids => [@user.id])
end

Then /^I should see chore "([^"]*)" for "([^"]*)" with deadline "([^"]*)"$/ do |chore_title, user_name, deadline|
  @user = User.find_by_name(user_name)
  #@time_string = ActionView::Helpers::DateHelper.distance_of_time_in_words(Time.parse(deadline))
  if response.respond_to? :should
    response.should contain(chore_title)
    response.should contain(@user.name)
    #response.should contain(@time_string)
  else
    assert_contain chore_title
    assert_contain @user.name
    #assert_contain distance_of_time_in_words(@time_string)
  end
end