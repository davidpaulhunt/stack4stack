require "rails_helper"

RSpec.describe JobseekersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/jobseekers").to route_to("jobseekers#index")
    end

    it "routes to #new" do
      expect(:get => "/jobseekers/new").to route_to("jobseekers#new")
    end

    it "routes to #show" do
      expect(:get => "/jobseekers/1").to route_to("jobseekers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/jobseekers/1/edit").to route_to("jobseekers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/jobseekers").to route_to("jobseekers#create")
    end

    it "routes to #update" do
      expect(:put => "/jobseekers/1").to route_to("jobseekers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/jobseekers/1").to route_to("jobseekers#destroy", :id => "1")
    end

  end
end
