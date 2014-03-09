require 'spec_helper'

describe "menu_backgrounds/index" do
  before(:each) do
    assign(:menu_backgrounds, [
      stub_model(MenuBackground),
      stub_model(MenuBackground)
    ])
  end

  it "renders a list of menu_backgrounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
