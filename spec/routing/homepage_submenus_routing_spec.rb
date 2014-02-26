require "spec_helper"

describe HomepageSubmenusController do
  describe "routing" do

    it "routes to #index" do
      get("/homepage_submenus").should route_to("homepage_submenus#index")
    end

    it "routes to #new" do
      get("/homepage_submenus/new").should route_to("homepage_submenus#new")
    end

    it "routes to #show" do
      get("/homepage_submenus/1").should route_to("homepage_submenus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/homepage_submenus/1/edit").should route_to("homepage_submenus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/homepage_submenus").should route_to("homepage_submenus#create")
    end

    it "routes to #update" do
      put("/homepage_submenus/1").should route_to("homepage_submenus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/homepage_submenus/1").should route_to("homepage_submenus#destroy", :id => "1")
    end

  end
end
