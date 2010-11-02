require 'spec_helper'

describe "/bills/index.html.erb" do
  include BillsHelper

  before(:each) do
    assigns[:bills] = [
      stub_model(Bill,
        :title => "value for title",
        :amount => 9.99,
        :is_evenly_split => false,
        :is_recurring => false
      ),
      stub_model(Bill,
        :title => "value for title",
        :amount => 9.99,
        :is_evenly_split => false,
        :is_recurring => false
      )
    ]
  end

  it "renders a list of bills" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
