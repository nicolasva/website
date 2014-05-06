require 'spec_helper'

describe "contact_us/show" do
  before(:each) do
    @contact_u = assign(:contact_u, stub_model(ContactU))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
