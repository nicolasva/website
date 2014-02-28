require 'spec_helper'

describe "background_annoncments/index" do
  before(:each) do
    assign(:background_annoncments, [
      stub_model(BackgroundAnnoncment),
      stub_model(BackgroundAnnoncment)
    ])
  end

  it "renders a list of background_annoncments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
