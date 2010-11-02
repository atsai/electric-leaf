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

When /^I visit the page for chore "([^"]*)"$/ do |chore_title|
  @chore = Chore.find_by_title(chore_title)
  @chore_page = "/chores/" + @chore.id.to_s
  visit @chore_page
end

When /^I click on chore "([^"]*)"$/ do |chore_title|
  #selenium.wait_for_text chore_title, :timeout_in_seconds => 10
  selenium.click "class=contentRow", :timeout_in_seconds => 10
end

When /^I click on the Title header$/ do
  selenium.click "class=text", :timeout_in_seconds => 5
end

When /^I click on the Deadline header$/ do
  selenium.click "class=sortfirstasc number", :timeout_in_seconds => 5
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

Then /^I should see "([^"]*)" "([^"]*)" and "([^"]*)" in order$/ do |chore1, chore2, chore3|
  wait_for do
    selenium.is_ordered(
      "id=#{chore1}",
      "id=#{chore2}"
    ).should be_true
  end
  wait_for do
    selenium.is_ordered(
      "id=#{chore2}",
      "id=#{chore3}"
    ).should be_true
  end
end