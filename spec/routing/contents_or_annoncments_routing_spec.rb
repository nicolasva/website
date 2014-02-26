require "spec_helper"

describe ContentsOrAnnoncmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/contents_or_annoncments").should route_to("contents_or_annoncments#index")
    end

    it "routes to #new" do
      get("/contents_or_annoncments/new").should route_to("contents_or_annoncments#new")
    end

    it "routes to #show" do
      get("/contents_or_annoncments/1").should route_to("contents_or_annoncments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contents_or_annoncments/1/edit").should route_to("contents_or_annoncments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contents_or_annoncments").should route_to("contents_or_annoncments#create")
    end

    it "routes to #update" do
      put("/contents_or_annoncments/1").should route_to("contents_or_annoncments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contents_or_annoncments/1").should route_to("contents_or_annoncments#destroy", :id => "1")
    end

  end
end
