require 'spec_helper'

describe "background_by_defaults/show" do
  before(:each) do
    @background_by_default = assign(:background_by_default, stub_model(BackgroundByDefault))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
