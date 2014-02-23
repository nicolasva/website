require 'spec_helper'

describe "annoncments/new" do
  before(:each) do
    assign(:annoncment, stub_model(Annoncment).as_new_record)
  end

  it "renders new annoncment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", annoncments_path, "post" do
    end
  end
end
