require 'spec_helper'

describe "contents_or_annoncments/edit" do
  before(:each) do
    @contents_or_annoncment = assign(:contents_or_annoncment, stub_model(ContentsOrAnnoncment))
  end

  it "renders the edit contents_or_annoncment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contents_or_annoncment_path(@contents_or_annoncment), "post" do
    end
  end
end
