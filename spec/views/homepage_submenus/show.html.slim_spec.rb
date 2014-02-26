require 'spec_helper'

describe "homepage_submenus/show" do
  before(:each) do
    @homepage_submenu = assign(:homepage_submenu, stub_model(HomepageSubmenu))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
