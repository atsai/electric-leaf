require 'spec_helper'

describe "/chore_associations/show.html.erb" do
  include ChoreAssociationsHelper
  before(:each) do
    assigns[:chore_association] = @chore_association = stub_model(ChoreAssociation,
      :user_id => 1,
      :chore_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
