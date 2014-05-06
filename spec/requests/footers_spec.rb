require 'spec_helper'

describe "Footers" do
  describe "GET /footers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get footers_path
      response.status.should be(200)
    end
  end
end
