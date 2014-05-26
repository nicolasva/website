require 'spec_helper'

describe "galery_photos/edit" do
  before(:each) do
    @galery_photo = assign(:galery_photo, stub_model(GaleryPhoto))
  end

  it "renders the edit galery_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", galery_photo_path(@galery_photo), "post" do
    end
  end
end
