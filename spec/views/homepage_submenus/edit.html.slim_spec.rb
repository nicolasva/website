require 'spec_helper'

describe "homepage_submenus/edit" do
  before(:each) do
    @homepage_submenu = assign(:homepage_submenu, stub_model(HomepageSubmenu))
  end

  it "renders the edit homepage_submenu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", homepage_submenu_path(@homepage_submenu), "post" do
    end
  end
end
