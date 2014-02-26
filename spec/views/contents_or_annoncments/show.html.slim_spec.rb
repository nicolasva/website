require 'spec_helper'

describe "contents_or_annoncments/show" do
  before(:each) do
    @contents_or_annoncment = assign(:contents_or_annoncment, stub_model(ContentsOrAnnoncment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
