require 'spec_helper'

describe "galery_photos/show" do
  before(:each) do
    @galery_photo = assign(:galery_photo, stub_model(GaleryPhoto))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
