require 'spec_helper'

describe "footer_backgrounds/edit" do
  before(:each) do
    @footer_background = assign(:footer_background, stub_model(FooterBackground))
  end

  it "renders the edit footer_background form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", footer_background_path(@footer_background), "post" do
    end
  end
end
