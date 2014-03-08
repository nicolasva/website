require 'spec_helper'

describe "header_backgrounds/edit" do
  before(:each) do
    @header_background = assign(:header_background, stub_model(HeaderBackground))
  end

  it "renders the edit header_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", header_background_path(@header_background), "post" do
    end
  end
end
