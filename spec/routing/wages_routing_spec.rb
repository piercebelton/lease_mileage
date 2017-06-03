require "rails_helper"

RSpec.describe WagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/wages").to route_to("wages#index")
    end

    it "routes to #new" do
      expect(:get => "/wages/new").to route_to("wages#new")
    end

    it "routes to #show" do
      expect(:get => "/wages/1").to route_to("wages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wages/1/edit").to route_to("wages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/wages").to route_to("wages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/wages/1").to route_to("wages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/wages/1").to route_to("wages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wages/1").to route_to("wages#destroy", :id => "1")
    end

  end
end
