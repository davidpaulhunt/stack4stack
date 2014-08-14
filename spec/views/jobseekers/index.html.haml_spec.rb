require 'rails_helper'

RSpec.describe "jobseekers/index", :type => :view do
  before(:each) do
    assign(:jobseekers, [
      Jobseeker.create!(),
      Jobseeker.create!()
    ])
  end

  it "renders a list of jobseekers" do
    render
  end
end
