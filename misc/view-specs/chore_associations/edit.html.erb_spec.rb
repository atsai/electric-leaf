require 'spec_helper'

describe "/chore_associations/edit.html.erb" do
  include ChoreAssociationsHelper

  before(:each) do
    assigns[:chore_association] = @chore_association = stub_model(ChoreAssociation,
      :new_record? => false,
      :user_id => 1,
      :chore_id => 1
    )
  end

  it "renders the edit chore_association form" do
    render

    response.should have_tag("form[action=#{chore_association_path(@chore_association)}][method=post]") do
      with_tag('input#chore_association_user_id[name=?]', "chore_association[user_id]")
      with_tag('input#chore_association_chore_id[name=?]', "chore_association[chore_id]")
    end
  end
end
