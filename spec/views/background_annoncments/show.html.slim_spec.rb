require 'spec_helper'

describe "background_annoncments/show" do
  before(:each) do
    @background_annoncment = assign(:background_annoncment, stub_model(BackgroundAnnoncment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
