require 'spec_helper'

describe "header_backgrounds/show" do
  before(:each) do
    @header_background = assign(:header_background, stub_model(HeaderBackground))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
