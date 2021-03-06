require "spec_helper"

describe SupplementalsController do
  describe "routing" do

    it "routes to #index" do
      get("/supplementals").should route_to("supplementals#index")
    end

    it "routes to #new" do
      get("/supplementals/new").should route_to("supplementals#new")
    end

    it "routes to #show" do
      get("/supplementals/1").should route_to("supplementals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supplementals/1/edit").should route_to("supplementals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supplementals").should route_to("supplementals#create")
    end

    it "routes to #update" do
      put("/supplementals/1").should route_to("supplementals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supplementals/1").should route_to("supplementals#destroy", :id => "1")
    end

  end
end
