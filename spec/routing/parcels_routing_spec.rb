require "spec_helper"

describe ParcelsController do
  describe "routing" do

    it "routes to #index" do
      get("/parcels").should route_to("parcels#index")
    end

    it "routes to #new" do
      get("/parcels/new").should route_to("parcels#new")
    end

    it "routes to #show" do
      get("/parcels/1").should route_to("parcels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/parcels/1/edit").should route_to("parcels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/parcels").should route_to("parcels#create")
    end

    it "routes to #update" do
      put("/parcels/1").should route_to("parcels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/parcels/1").should route_to("parcels#destroy", :id => "1")
    end

  end
end
