require 'spec_helper'

describe "homepage_submenus/index" do
  before(:each) do
    assign(:homepage_submenus, [
      stub_model(HomepageSubmenu),
      stub_model(HomepageSubmenu)
    ])
  end

  it "renders a list of homepage_submenus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
