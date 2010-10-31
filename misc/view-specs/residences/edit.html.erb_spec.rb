require 'spec_helper'

describe "/residences/edit.html.erb" do
  include ResidencesHelper

  before(:each) do
    assigns[:residence] = @residence = stub_model(Residence,
      :new_record? => false
    )
  end

  it "renders the edit residence form" do
    render

    response.should have_tag("form[action=#{residence_path(@residence)}][method=post]") do
    end
  end
end
