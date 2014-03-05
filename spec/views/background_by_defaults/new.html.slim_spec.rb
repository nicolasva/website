require 'spec_helper'

describe "background_by_defaults/new" do
  before(:each) do
    assign(:background_by_default, stub_model(BackgroundByDefault).as_new_record)
  end

  it "renders new background_by_default form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_by_defaults_path, "post" do
    end
  end
end
