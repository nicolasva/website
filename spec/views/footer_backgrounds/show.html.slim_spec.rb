require 'spec_helper'

describe "footer_backgrounds/show" do
  before(:each) do
    @footer_background = assign(:footer_background, stub_model(FooterBackground))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
