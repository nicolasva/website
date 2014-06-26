require 'rails_helper'

RSpec.describe "nifty_corners/new", :type => :view do
  before(:each) do
    assign(:nifty_corner, NiftyCorner.new())
  end

  it "renders new nifty_corner form" do
    render

    assert_select "form[action=?][method=?]", nifty_corners_path, "post" do
    end
  end
end
