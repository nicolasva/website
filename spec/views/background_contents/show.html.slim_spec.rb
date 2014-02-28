require 'spec_helper'

describe "background_contents/show" do
  before(:each) do
    @background_content = assign(:background_content, stub_model(BackgroundContent))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
