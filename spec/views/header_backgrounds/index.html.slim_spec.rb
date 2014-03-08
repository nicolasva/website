require 'spec_helper'

describe "header_backgrounds/index" do
  before(:each) do
    assign(:header_backgrounds, [
      stub_model(HeaderBackground),
      stub_model(HeaderBackground)
    ])
  end

  it "renders a list of header_backgrounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
