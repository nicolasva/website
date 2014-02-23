require "spec_helper"

describe AnnoncmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/annoncments").should route_to("annoncments#index")
    end

    it "routes to #new" do
      get("/annoncments/new").should route_to("annoncments#new")
    end

    it "routes to #show" do
      get("/annoncments/1").should route_to("annoncments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/annoncments/1/edit").should route_to("annoncments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/annoncments").should route_to("annoncments#create")
    end

    it "routes to #update" do
      put("/annoncments/1").should route_to("annoncments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/annoncments/1").should route_to("annoncments#destroy", :id => "1")
    end

  end
end
