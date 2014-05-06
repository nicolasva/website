require 'spec_helper'

describe "footers/index" do
  before(:each) do
    assign(:footers, [
      stub_model(Footer),
      stub_model(Footer)
    ])
  end

  it "renders a list of footers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
