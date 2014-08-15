require 'rails_helper'

RSpec.describe "JobApplies", :type => :request do
  describe "GET /job_applications" do
    it "works! (now write some real specs)" do
      get job_applications_path
      expect(response.status).to be(200)
    end
  end
end
