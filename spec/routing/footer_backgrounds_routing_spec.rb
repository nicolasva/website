require "spec_helper"

describe FooterBackgroundsController do
  describe "routing" do

    it "routes to #index" do
      get("/footer_backgrounds").should route_to("footer_backgrounds#index")
    end

    it "routes to #new" do
      get("/footer_backgrounds/new").should route_to("footer_backgrounds#new")
    end

    it "routes to #show" do
      get("/footer_backgrounds/1").should route_to("footer_backgrounds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/footer_backgrounds/1/edit").should route_to("footer_backgrounds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/footer_backgrounds").should route_to("footer_backgrounds#create")
    end

    it "routes to #update" do
      put("/footer_backgrounds/1").should route_to("footer_backgrounds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/footer_backgrounds/1").should route_to("footer_backgrounds#destroy", :id => "1")
    end

  end
end
