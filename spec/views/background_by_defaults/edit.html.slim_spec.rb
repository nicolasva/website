require 'spec_helper'

describe "background_by_defaults/edit" do
  before(:each) do
    @background_by_default = assign(:background_by_default, stub_model(BackgroundByDefault))
  end

  it "renders the edit background_by_default form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_by_default_path(@background_by_default), "post" do
    end
  end
end
