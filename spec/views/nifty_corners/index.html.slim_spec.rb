require 'rails_helper'

RSpec.describe "nifty_corners/index", :type => :view do
  before(:each) do
    assign(:nifty_corners, [
      NiftyCorner.create!(),
      NiftyCorner.create!()
    ])
  end

  it "renders a list of nifty_corners" do
    render
  end
end
