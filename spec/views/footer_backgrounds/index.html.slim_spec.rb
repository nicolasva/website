require 'spec_helper'

describe "footer_backgrounds/index" do
  before(:each) do
    assign(:footer_backgrounds, [
      stub_model(FooterBackground),
      stub_model(FooterBackground)
    ])
  end

  it "renders a list of footer_backgrounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
