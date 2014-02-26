require 'spec_helper'

describe "contents_or_annoncments/new" do
  before(:each) do
    assign(:contents_or_annoncment, stub_model(ContentsOrAnnoncment).as_new_record)
  end

  it "renders new contents_or_annoncment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contents_or_annoncments_path, "post" do
    end
  end
end
