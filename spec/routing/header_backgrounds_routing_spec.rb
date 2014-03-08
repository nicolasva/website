require "spec_helper"

describe HeaderBackgroundsController do
  describe "routing" do

    it "routes to #index" do
      get("/header_backgrounds").should route_to("header_backgrounds#index")
    end

    it "routes to #new" do
      get("/header_backgrounds/new").should route_to("header_backgrounds#new")
    end

    it "routes to #show" do
      get("/header_backgrounds/1").should route_to("header_backgrounds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/header_backgrounds/1/edit").should route_to("header_backgrounds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/header_backgrounds").should route_to("header_backgrounds#create")
    end

    it "routes to #update" do
      put("/header_backgrounds/1").should route_to("header_backgrounds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/header_backgrounds/1").should route_to("header_backgrounds#destroy", :id => "1")
    end

  end
end
