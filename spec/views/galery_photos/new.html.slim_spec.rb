require 'spec_helper'

describe "galery_photos/new" do
  before(:each) do
    assign(:galery_photo, stub_model(GaleryPhoto).as_new_record)
  end

  it "renders new galery_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", galery_photos_path, "post" do
    end
  end
end
