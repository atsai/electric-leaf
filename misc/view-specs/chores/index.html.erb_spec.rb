require 'spec_helper'

describe "/chores/index.html.erb" do
  include ChoresHelper

  before(:each) do
    assigns[:chores] = [
      stub_model(Chore,
        :title => "value for title",
        :description => "value for description",
        :is_recurring => false,
        :is_rotating => false,
        :is_done => false,
        :residence_id => 1
      ),
      stub_model(Chore,
        :title => "value for title",
        :description => "value for description",
        :is_recurring => false,
        :is_rotating => false,
        :is_done => false,
        :residence_id => 1
      )
    ]
  end

  it "renders a list of chores" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
