require "spec_helper"

describe MenuBackgroundsController do
  describe "routing" do

    it "routes to #index" do
      get("/menu_backgrounds").should route_to("menu_backgrounds#index")
    end

    it "routes to #new" do
      get("/menu_backgrounds/new").should route_to("menu_backgrounds#new")
    end

    it "routes to #show" do
      get("/menu_backgrounds/1").should route_to("menu_backgrounds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/menu_backgrounds/1/edit").should route_to("menu_backgrounds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/menu_backgrounds").should route_to("menu_backgrounds#create")
    end

    it "routes to #update" do
      put("/menu_backgrounds/1").should route_to("menu_backgrounds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/menu_backgrounds/1").should route_to("menu_backgrounds#destroy", :id => "1")
    end

  end
end
