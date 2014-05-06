require 'spec_helper'

describe "footers/new" do
  before(:each) do
    assign(:footer, stub_model(Footer).as_new_record)
  end

  it "renders new footer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", footers_path, "post" do
    end
  end
end
