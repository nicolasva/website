require 'rails_helper'

RSpec.describe "nifty_corners/edit", :type => :view do
  before(:each) do
    @nifty_corner = assign(:nifty_corner, NiftyCorner.create!())
  end

  it "renders the edit nifty_corner form" do
    render

    assert_select "form[action=?][method=?]", nifty_corner_path(@nifty_corner), "post" do
    end
  end
end
