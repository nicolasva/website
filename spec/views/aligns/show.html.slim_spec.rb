require 'spec_helper'

describe "aligns/show" do
  before(:each) do
    @align = assign(:align, stub_model(Align))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
