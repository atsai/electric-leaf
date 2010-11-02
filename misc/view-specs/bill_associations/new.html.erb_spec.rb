require 'spec_helper'

describe "/bill_associations/new.html.erb" do
  include BillAssociationsHelper

  before(:each) do
    assigns[:bill_association] = stub_model(BillAssociation,
      :new_record? => true,
      :user_id => 1,
      :bill_id => 1
    )
  end

  it "renders new bill_association form" do
    render

    response.should have_tag("form[action=?][method=post]", bill_associations_path) do
      with_tag("input#bill_association_user_id[name=?]", "bill_association[user_id]")
      with_tag("input#bill_association_bill_id[name=?]", "bill_association[bill_id]")
    end
  end
end
