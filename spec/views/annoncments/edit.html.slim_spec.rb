require 'spec_helper'

describe "annoncments/edit" do
  before(:each) do
    @annoncment = assign(:annoncment, stub_model(Annoncment))
  end

  it "renders the edit annoncment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", annoncment_path(@annoncment), "post" do
    end
  end
end
