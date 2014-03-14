require 'spec_helper'

describe "sub_menu_backgrounds/show" do
  before(:each) do
    @sub_menu_background = assign(:sub_menu_background, stub_model(SubMenuBackground))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
