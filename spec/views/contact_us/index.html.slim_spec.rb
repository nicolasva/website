require 'spec_helper'

describe "contact_us/index" do
  before(:each) do
    assign(:contact_us, [
      stub_model(ContactU),
      stub_model(ContactU)
    ])
  end

  it "renders a list of contact_us" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
