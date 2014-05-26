require 'spec_helper'

describe "galery_photos/index" do
  before(:each) do
    assign(:galery_photos, [
      stub_model(GaleryPhoto),
      stub_model(GaleryPhoto)
    ])
  end

  it "renders a list of galery_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
