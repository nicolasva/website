require "spec_helper"

describe FootersController do
  describe "routing" do

    it "routes to #index" do
      get("/footers").should route_to("footers#index")
    end

    it "routes to #new" do
      get("/footers/new").should route_to("footers#new")
    end

    it "routes to #show" do
      get("/footers/1").should route_to("footers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/footers/1/edit").should route_to("footers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/footers").should route_to("footers#create")
    end

    it "routes to #update" do
      put("/footers/1").should route_to("footers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/footers/1").should route_to("footers#destroy", :id => "1")
    end

  end
end
