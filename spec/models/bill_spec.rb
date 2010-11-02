require 'spec_helper'

describe Bill do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :amount => 9.99,
      :is_evenly_split => false,
      :deadline => Time.now,
      :is_recurring => false
    }
  end

  it "should create a new instance given valid attributes" do
    Bill.create!(@valid_attributes)
  end
end
