require "spec_helper"

describe BackgroundAnnoncmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/background_annoncments").should route_to("background_annoncments#index")
    end

    it "routes to #new" do
      get("/background_annoncments/new").should route_to("background_annoncments#new")
    end

    it "routes to #show" do
      get("/background_annoncments/1").should route_to("background_annoncments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/background_annoncments/1/edit").should route_to("background_annoncments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/background_annoncments").should route_to("background_annoncments#create")
    end

    it "routes to #update" do
      put("/background_annoncments/1").should route_to("background_annoncments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/background_annoncments/1").should route_to("background_annoncments#destroy", :id => "1")
    end

  end
end
