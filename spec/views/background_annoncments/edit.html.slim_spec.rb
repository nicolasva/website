require 'spec_helper'

describe "background_annoncments/edit" do
  before(:each) do
    @background_annoncment = assign(:background_annoncment, stub_model(BackgroundAnnoncment))
  end

  it "renders the edit background_annoncment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_annoncment_path(@background_annoncment), "post" do
    end
  end
end
