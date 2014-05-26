require "spec_helper"

describe GaleryPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/galery_photos").should route_to("galery_photos#index")
    end

    it "routes to #new" do
      get("/galery_photos/new").should route_to("galery_photos#new")
    end

    it "routes to #show" do
      get("/galery_photos/1").should route_to("galery_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/galery_photos/1/edit").should route_to("galery_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/galery_photos").should route_to("galery_photos#create")
    end

    it "routes to #update" do
      put("/galery_photos/1").should route_to("galery_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/galery_photos/1").should route_to("galery_photos#destroy", :id => "1")
    end

  end
end
