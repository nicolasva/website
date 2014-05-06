require "spec_helper"

describe ContactUsController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_us").should route_to("contact_us#index")
    end

    it "routes to #new" do
      get("/contact_us/new").should route_to("contact_us#new")
    end

    it "routes to #show" do
      get("/contact_us/1").should route_to("contact_us#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_us/1/edit").should route_to("contact_us#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_us").should route_to("contact_us#create")
    end

    it "routes to #update" do
      put("/contact_us/1").should route_to("contact_us#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_us/1").should route_to("contact_us#destroy", :id => "1")
    end

  end
end
