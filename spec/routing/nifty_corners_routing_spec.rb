require "rails_helper"

RSpec.describe NiftyCornersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nifty_corners").to route_to("nifty_corners#index")
    end

    it "routes to #new" do
      expect(:get => "/nifty_corners/new").to route_to("nifty_corners#new")
    end

    it "routes to #show" do
      expect(:get => "/nifty_corners/1").to route_to("nifty_corners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nifty_corners/1/edit").to route_to("nifty_corners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nifty_corners").to route_to("nifty_corners#create")
    end

    it "routes to #update" do
      expect(:put => "/nifty_corners/1").to route_to("nifty_corners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nifty_corners/1").to route_to("nifty_corners#destroy", :id => "1")
    end

  end
end
