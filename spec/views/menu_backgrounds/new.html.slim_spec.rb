require 'spec_helper'

describe "menu_backgrounds/new" do
  before(:each) do
    assign(:menu_background, stub_model(MenuBackground).as_new_record)
  end

  it "renders new menu_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_backgrounds_path, "post" do
    end
  end
end
