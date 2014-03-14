require 'spec_helper'

describe "sub_menu_backgrounds/index" do
  before(:each) do
    assign(:sub_menu_backgrounds, [
      stub_model(SubMenuBackground),
      stub_model(SubMenuBackground)
    ])
  end

  it "renders a list of sub_menu_backgrounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
