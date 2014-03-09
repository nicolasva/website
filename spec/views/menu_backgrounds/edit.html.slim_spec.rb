require 'spec_helper'

describe "menu_backgrounds/edit" do
  before(:each) do
    @menu_background = assign(:menu_background, stub_model(MenuBackground))
  end

  it "renders the edit menu_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_background_path(@menu_background), "post" do
    end
  end
end
