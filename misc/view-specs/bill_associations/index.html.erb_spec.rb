require 'spec_helper'

describe "/bill_associations/index.html.erb" do
  include BillAssociationsHelper

  before(:each) do
    assigns[:bill_associations] = [
      stub_model(BillAssociation,
        :user_id => 1,
        :bill_id => 1
      ),
      stub_model(BillAssociation,
        :user_id => 1,
        :bill_id => 1
      )
    ]
  end

  it "renders a list of bill_associations" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
