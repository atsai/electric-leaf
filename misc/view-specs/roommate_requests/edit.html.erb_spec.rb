require 'spec_helper'

describe "/roommate_requests/edit.html.erb" do
  include RoommateRequestsHelper

  before(:each) do
    assigns[:roommate_request] = @roommate_request = stub_model(RoommateRequest,
      :new_record? => false,
      :user_id => 1,
      :requester_id => 1,
      :status => 1
    )
  end

  it "renders the edit roommate_request form" do
    render

    response.should have_tag("form[action=#{roommate_request_path(@roommate_request)}][method=post]") do
      with_tag('input#roommate_request_user_id[name=?]', "roommate_request[user_id]")
      with_tag('input#roommate_request_requester_id[name=?]', "roommate_request[requester_id]")
      with_tag('input#roommate_request_status[name=?]', "roommate_request[status]")
    end
  end
end
