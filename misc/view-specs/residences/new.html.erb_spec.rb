require 'spec_helper'

describe "/residences/new.html.erb" do
  include ResidencesHelper

  before(:each) do
    assigns[:residence] = stub_model(Residence,
      :new_record? => true
    )
  end

  it "renders new residence form" do
    render

    response.should have_tag("form[action=?][method=post]", residences_path) do
    end
  end
end
