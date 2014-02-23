require 'spec_helper'

describe "annoncments/show" do
  before(:each) do
    @annoncment = assign(:annoncment, stub_model(Annoncment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
