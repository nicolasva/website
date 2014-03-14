require 'spec_helper'

describe "sub_menu_backgrounds/new" do
  before(:each) do
    assign(:sub_menu_background, stub_model(SubMenuBackground).as_new_record)
  end

  it "renders new sub_menu_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sub_menu_backgrounds_path, "post" do
    end
  end
end
