require 'spec_helper'

describe "/bill_associations/show.html.erb" do
  include BillAssociationsHelper
  before(:each) do
    assigns[:bill_association] = @bill_association = stub_model(BillAssociation,
      :user_id => 1,
      :bill_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
