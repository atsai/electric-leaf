require 'spec_helper'

describe "/roommate_requests/index.html.erb" do
  include RoommateRequestsHelper

  before(:each) do
    assigns[:roommate_requests] = [
      stub_model(RoommateRequest,
        :user_id => 1,
        :requester_id => 1,
        :status => 1
      ),
      stub_model(RoommateRequest,
        :user_id => 1,
        :requester_id => 1,
        :status => 1
      )
    ]
  end

  it "renders a list of roommate_requests" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
