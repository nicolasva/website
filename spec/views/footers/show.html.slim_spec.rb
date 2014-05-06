require 'spec_helper'

describe "footers/show" do
  before(:each) do
    @footer = assign(:footer, stub_model(Footer))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
