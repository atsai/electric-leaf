require 'spec_helper'

describe "/residences/show.html.erb" do
  include ResidencesHelper
  before(:each) do
    assigns[:residence] = @residence = stub_model(Residence)
  end

  it "renders attributes in <p>" do
    render
  end
end
