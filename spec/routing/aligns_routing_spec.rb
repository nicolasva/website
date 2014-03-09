require "spec_helper"

describe AlignsController do
  describe "routing" do

    it "routes to #index" do
      get("/aligns").should route_to("aligns#index")
    end

    it "routes to #new" do
      get("/aligns/new").should route_to("aligns#new")
    end

    it "routes to #show" do
      get("/aligns/1").should route_to("aligns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aligns/1/edit").should route_to("aligns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aligns").should route_to("aligns#create")
    end

    it "routes to #update" do
      put("/aligns/1").should route_to("aligns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aligns/1").should route_to("aligns#destroy", :id => "1")
    end

  end
end
