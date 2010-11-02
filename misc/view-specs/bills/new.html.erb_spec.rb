require 'spec_helper'

describe "/bills/new.html.erb" do
  include BillsHelper

  before(:each) do
    assigns[:bill] = stub_model(Bill,
      :new_record? => true,
      :title => "value for title",
      :amount => 9.99,
      :is_evenly_split => false,
      :is_recurring => false
    )
  end

  it "renders new bill form" do
    render

    response.should have_tag("form[action=?][method=post]", bills_path) do
      with_tag("input#bill_title[name=?]", "bill[title]")
      with_tag("input#bill_amount[name=?]", "bill[amount]")
      with_tag("input#bill_is_evenly_split[name=?]", "bill[is_evenly_split]")
      with_tag("input#bill_is_recurring[name=?]", "bill[is_recurring]")
    end
  end
end
