require 'spec_helper'

describe "contents_or_annoncments/index" do
  before(:each) do
    assign(:contents_or_annoncments, [
      stub_model(ContentsOrAnnoncment),
      stub_model(ContentsOrAnnoncment)
    ])
  end

  it "renders a list of contents_or_annoncments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
