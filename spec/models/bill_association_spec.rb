require 'spec_helper'

describe BillAssociation do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :bill_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    BillAssociation.create!(@valid_attributes)
  end
end
