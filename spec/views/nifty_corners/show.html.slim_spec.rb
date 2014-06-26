require 'rails_helper'

RSpec.describe "nifty_corners/show", :type => :view do
  before(:each) do
    @nifty_corner = assign(:nifty_corner, NiftyCorner.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
