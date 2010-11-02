require 'spec_helper'

describe "/bills/show.html.erb" do
  include BillsHelper
  before(:each) do
    assigns[:bill] = @bill = stub_model(Bill,
      :title => "value for title",
      :amount => 9.99,
      :is_evenly_split => false,
      :is_recurring => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/9\.99/)
    response.should have_text(/false/)
    response.should have_text(/false/)
  end
end
