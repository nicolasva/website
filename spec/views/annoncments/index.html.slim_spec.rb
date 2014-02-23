require 'spec_helper'

describe "annoncments/index" do
  before(:each) do
    assign(:annoncments, [
      stub_model(Annoncment),
      stub_model(Annoncment)
    ])
  end

  it "renders a list of annoncments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
