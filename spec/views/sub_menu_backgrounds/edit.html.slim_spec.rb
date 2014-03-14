require 'spec_helper'

describe "sub_menu_backgrounds/edit" do
  before(:each) do
    @sub_menu_background = assign(:sub_menu_background, stub_model(SubMenuBackground))
  end

  it "renders the edit sub_menu_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sub_menu_background_path(@sub_menu_background), "post" do
    end
  end
end
