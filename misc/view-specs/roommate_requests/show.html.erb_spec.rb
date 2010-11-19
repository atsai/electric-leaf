require 'spec_helper'

describe "/roommate_requests/show.html.erb" do
  include RoommateRequestsHelper
  before(:each) do
    assigns[:roommate_request] = @roommate_request = stub_model(RoommateRequest,
      :user_id => 1,
      :requester_id => 1,
      :status => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
