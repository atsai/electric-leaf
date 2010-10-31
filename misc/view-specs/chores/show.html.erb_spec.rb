require 'spec_helper'

describe "/chores/show.html.erb" do
  include ChoresHelper
  before(:each) do
    assigns[:chore] = @chore = stub_model(Chore,
      :title => "value for title",
      :description => "value for description",
      :is_recurring => false,
      :is_rotating => false,
      :is_done => false,
      :residence_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/1/)
  end
end
