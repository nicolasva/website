require "spec_helper"

describe BackgroundByDefaultsController do
  describe "routing" do

    it "routes to #index" do
      get("/background_by_defaults").should route_to("background_by_defaults#index")
    end

    it "routes to #new" do
      get("/background_by_defaults/new").should route_to("background_by_defaults#new")
    end

    it "routes to #show" do
      get("/background_by_defaults/1").should route_to("background_by_defaults#show", :id => "1")
    end

    it "routes to #edit" do
      get("/background_by_defaults/1/edit").should route_to("background_by_defaults#edit", :id => "1")
    end

    it "routes to #create" do
      post("/background_by_defaults").should route_to("background_by_defaults#create")
    end

    it "routes to #update" do
      put("/background_by_defaults/1").should route_to("background_by_defaults#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/background_by_defaults/1").should route_to("background_by_defaults#destroy", :id => "1")
    end

  end
end
