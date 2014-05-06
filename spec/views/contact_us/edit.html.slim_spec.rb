require 'spec_helper'

describe "contact_us/edit" do
  before(:each) do
    @contact_u = assign(:contact_u, stub_model(ContactU))
  end

  it "renders the edit contact_u form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_u_path(@contact_u), "post" do
    end
  end
end
