require 'spec_helper'

describe "background_contents/edit" do
  before(:each) do
    @background_content = assign(:background_content, stub_model(BackgroundContent))
  end

  it "renders the edit background_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_content_path(@background_content), "post" do
    end
  end
end
