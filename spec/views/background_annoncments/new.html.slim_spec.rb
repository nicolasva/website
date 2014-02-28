require 'spec_helper'

describe "background_annoncments/new" do
  before(:each) do
    assign(:background_annoncment, stub_model(BackgroundAnnoncment).as_new_record)
  end

  it "renders new background_annoncment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_annoncments_path, "post" do
    end
  end
end
