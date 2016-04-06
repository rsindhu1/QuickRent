require "rails_helper"

RSpec.describe HousesController, type: :routing do
  describe "routing" do

    it "routes to #welcome" do
      expect(:get => "/").to route_to("houses#welcome")
    end

    it "routes to #new" do
      expect(:get => "/houses/new").to route_to("houses#new")
    end

    it "routes to #show" do
      expect(:get => "/houses/show").to route_to("houses#show")
    end

    it "routes to #edit" do
      expect(:get => "/houses/edit").to route_to("houses#edit")
    end

    it "routes to #create" do
      expect(:post => "/houses").to route_to("houses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/houses/1").to route_to("houses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/houses/1").to route_to("houses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/houses/1").to route_to("houses#destroy", :id => "1")
    end

  end
end