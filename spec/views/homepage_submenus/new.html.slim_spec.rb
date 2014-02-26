require 'spec_helper'

describe "homepage_submenus/new" do
  before(:each) do
    assign(:homepage_submenu, stub_model(HomepageSubmenu).as_new_record)
  end

  it "renders new homepage_submenu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", homepage_submenus_path, "post" do
    end
  end
end
