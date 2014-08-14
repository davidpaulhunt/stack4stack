require 'rails_helper'

RSpec.describe "jobseekers/edit", :type => :view do
  before(:each) do
    @jobseeker = assign(:jobseeker, Jobseeker.create!())
  end

  it "renders the edit jobseeker form" do
    render

    assert_select "form[action=?][method=?]", jobseeker_path(@jobseeker), "post" do
    end
  end
end
