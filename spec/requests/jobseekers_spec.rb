require 'rails_helper'

RSpec.describe "Jobseekers", :type => :request do
  describe "GET /jobseekers" do
    it "works! (now write some real specs)" do
      get jobseekers_path
      expect(response.status).to be(200)
    end
  end
end
