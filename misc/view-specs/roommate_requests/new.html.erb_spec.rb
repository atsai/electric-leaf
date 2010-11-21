require 'spec_helper'

describe "/roommate_requests/new.html.erb" do
  include RoommateRequestsHelper

  before(:each) do
    assigns[:roommate_request] = stub_model(RoommateRequest,
      :new_record? => true,
      :user_id => 1,
      :requester_id => 1,
      :status => 1
    )
  end

  it "renders new roommate_request form" do
    render

    response.should have_tag("form[action=?][method=post]", roommate_requests_path) do
      with_tag("input#roommate_request_user_id[name=?]", "roommate_request[user_id]")
      with_tag("input#roommate_request_requester_id[name=?]", "roommate_request[requester_id]")
      with_tag("input#roommate_request_status[name=?]", "roommate_request[status]")
    end
  end
end
