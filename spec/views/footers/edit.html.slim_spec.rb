require 'spec_helper'

describe "footers/edit" do
  before(:each) do
    @footer = assign(:footer, stub_model(Footer))
  end

  it "renders the edit footer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", footer_path(@footer), "post" do
    end
  end
end
