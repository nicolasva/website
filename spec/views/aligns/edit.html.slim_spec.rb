require 'spec_helper'

describe "aligns/edit" do
  before(:each) do
    @align = assign(:align, stub_model(Align))
  end

  it "renders the edit align form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", align_path(@align), "post" do
    end
  end
end
