require 'spec_helper'

describe "background_by_defaults/index" do
  before(:each) do
    assign(:background_by_defaults, [
      stub_model(BackgroundByDefault),
      stub_model(BackgroundByDefault)
    ])
  end

  it "renders a list of background_by_defaults" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
