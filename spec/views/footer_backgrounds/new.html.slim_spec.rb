require 'spec_helper'

describe "footer_backgrounds/new" do
  before(:each) do
    assign(:footer_background, stub_model(FooterBackground).as_new_record)
  end

  it "renders new footer_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", footer_backgrounds_path, "post" do
    end
  end
end
