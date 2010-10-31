require 'spec_helper'

describe "/chores/new.html.erb" do
  include ChoresHelper

  before(:each) do
    assigns[:chore] = stub_model(Chore,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :is_recurring => false,
      :is_rotating => false,
      :is_done => false,
      :residence_id => 1
    )
  end

  it "renders new chore form" do
    render

    response.should have_tag("form[action=?][method=post]", chores_path) do
      with_tag("input#chore_title[name=?]", "chore[title]")
      with_tag("input#chore_description[name=?]", "chore[description]")
      with_tag("input#chore_is_recurring[name=?]", "chore[is_recurring]")
      with_tag("input#chore_is_rotating[name=?]", "chore[is_rotating]")
      with_tag("input#chore_is_done[name=?]", "chore[is_done]")
      with_tag("input#chore_residence_id[name=?]", "chore[residence_id]")
    end
  end
end
