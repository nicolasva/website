require 'spec_helper'

describe "background_contents/new" do
  before(:each) do
    assign(:background_content, stub_model(BackgroundContent).as_new_record)
  end

  it "renders new background_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_contents_path, "post" do
    end
  end
end
