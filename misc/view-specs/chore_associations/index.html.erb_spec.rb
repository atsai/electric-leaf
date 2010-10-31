require 'spec_helper'

describe "/chore_associations/index.html.erb" do
  include ChoreAssociationsHelper

  before(:each) do
    assigns[:chore_associations] = [
      stub_model(ChoreAssociation,
        :user_id => 1,
        :chore_id => 1
      ),
      stub_model(ChoreAssociation,
        :user_id => 1,
        :chore_id => 1
      )
    ]
  end

  it "renders a list of chore_associations" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
