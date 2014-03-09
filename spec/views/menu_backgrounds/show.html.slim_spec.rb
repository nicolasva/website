require 'spec_helper'

describe "menu_backgrounds/show" do
  before(:each) do
    @menu_background = assign(:menu_background, stub_model(MenuBackground))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
