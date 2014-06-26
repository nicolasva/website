require 'rails_helper'

RSpec.describe "NiftyCorners", :type => :request do
  describe "GET /nifty_corners" do
    it "works! (now write some real specs)" do
      get nifty_corners_path
      expect(response.status).to be(200)
    end
  end
end
