require 'spec_helper'

describe "header_backgrounds/new" do
  before(:each) do
    assign(:header_background, stub_model(HeaderBackground).as_new_record)
  end

  it "renders new header_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", header_backgrounds_path, "post" do
    end
  end
end
