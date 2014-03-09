require 'spec_helper'

describe "aligns/new" do
  before(:each) do
    assign(:align, stub_model(Align).as_new_record)
  end

  it "renders new align form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aligns_path, "post" do
    end
  end
end
