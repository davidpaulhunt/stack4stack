require 'rails_helper'

RSpec.describe "jobseekers/new", :type => :view do
  before(:each) do
    assign(:jobseeker, Jobseeker.new())
  end

  it "renders new jobseeker form" do
    render

    assert_select "form[action=?][method=?]", jobseekers_path, "post" do
    end
  end
end
