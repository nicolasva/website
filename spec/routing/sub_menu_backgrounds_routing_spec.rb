require "spec_helper"

describe SubMenuBackgroundsController do
  describe "routing" do

    it "routes to #index" do
      get("/sub_menu_backgrounds").should route_to("sub_menu_backgrounds#index")
    end

    it "routes to #new" do
      get("/sub_menu_backgrounds/new").should route_to("sub_menu_backgrounds#new")
    end

    it "routes to #show" do
      get("/sub_menu_backgrounds/1").should route_to("sub_menu_backgrounds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sub_menu_backgrounds/1/edit").should route_to("sub_menu_backgrounds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sub_menu_backgrounds").should route_to("sub_menu_backgrounds#create")
    end

    it "routes to #update" do
      put("/sub_menu_backgrounds/1").should route_to("sub_menu_backgrounds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sub_menu_backgrounds/1").should route_to("sub_menu_backgrounds#destroy", :id => "1")
    end

  end
end
