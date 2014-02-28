require 'spec_helper'

describe "background_contents/index" do
  before(:each) do
    assign(:background_contents, [
      stub_model(BackgroundContent),
      stub_model(BackgroundContent)
    ])
  end

  it "renders a list of background_contents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
