require 'spec_helper'

describe "/chore_associations/new.html.erb" do
  include ChoreAssociationsHelper

  before(:each) do
    assigns[:chore_association] = stub_model(ChoreAssociation,
      :new_record? => true,
      :user_id => 1,
      :chore_id => 1
    )
  end

  it "renders new chore_association form" do
    render

    response.should have_tag("form[action=?][method=post]", chore_associations_path) do
      with_tag("input#chore_association_user_id[name=?]", "chore_association[user_id]")
      with_tag("input#chore_association_chore_id[name=?]", "chore_association[chore_id]")
    end
  end
end
