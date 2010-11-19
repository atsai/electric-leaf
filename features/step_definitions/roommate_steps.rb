Given /^a roommate request is pending for "([^"]*)" from "([^"]*)"$/ do |user_name, requester_name|
  @user = User.find_by_name(user_name)
  @requester = User.find_by_name(requester_name)
  @user.roommate_request = RoommateRequest.create!(:user_id => @user.id, :requester_id => @requester.id, :status => 0)
  @user.save!
end