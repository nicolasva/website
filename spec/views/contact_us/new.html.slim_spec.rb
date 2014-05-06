require 'spec_helper'

describe "contact_us/new" do
  before(:each) do
    assign(:contact_u, stub_model(ContactU).as_new_record)
  end

  it "renders new contact_u form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_us_path, "post" do
    end
  end
end
