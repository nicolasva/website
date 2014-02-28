require "spec_helper"

describe BackgroundContentsController do
  describe "routing" do

    it "routes to #index" do
      get("/background_contents").should route_to("background_contents#index")
    end

    it "routes to #new" do
      get("/background_contents/new").should route_to("background_contents#new")
    end

    it "routes to #show" do
      get("/background_contents/1").should route_to("background_contents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/background_contents/1/edit").should route_to("background_contents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/background_contents").should route_to("background_contents#create")
    end

    it "routes to #update" do
      put("/background_contents/1").should route_to("background_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/background_contents/1").should route_to("background_contents#destroy", :id => "1")
    end

  end
end
