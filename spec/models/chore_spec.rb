require 'spec_helper'

describe Chore do
  before(:each) do
    User.create!(:name => "Test User", :residence_id => 1)
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :deadline => Time.now,
      :user_ids => [1],
      :is_recurring => false,
      :is_rotating => false,
      :is_done => false,
      :residence_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Chore.create!(@valid_attributes)
  end
end
