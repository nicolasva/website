require 'spec_helper'

describe "aligns/index" do
  before(:each) do
    assign(:aligns, [
      stub_model(Align),
      stub_model(Align)
    ])
  end

  it "renders a list of aligns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
