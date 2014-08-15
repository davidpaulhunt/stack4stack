require 'rails_helper'

RSpec.describe "JobApplies", :type => :request do
  describe "GET /job_applies" do
    it "works! (now write some real specs)" do
      get job_applies_path
      expect(response.status).to be(200)
    end
  end
end
