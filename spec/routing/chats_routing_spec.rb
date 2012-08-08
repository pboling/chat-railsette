require "spec_helper"

describe ChatsController do
  describe "routing" do

    it "routes to #index" do
      get("/chats").should route_to("chats#index")
    end

    it "routes to #new" do
      get("/chats/new").should route_to("chats#new")
    end

    it "routes to #show" do
      get("/chats/1").should route_to("chats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/chats/1/edit").should route_to("chats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/chats").should route_to("chats#create")
    end

    it "routes to #update" do
      put("/chats/1").should route_to("chats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/chats/1").should route_to("chats#destroy", :id => "1")
    end

  end
end
