require 'spec_helper'

describe "/residences/index.html.erb" do
  include ResidencesHelper

  before(:each) do
    assigns[:residences] = [
      stub_model(Residence),
      stub_model(Residence)
    ]
  end

  it "renders a list of residences" do
    render
  end
end
