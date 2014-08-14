require 'rails_helper'

RSpec.describe "job_posts/show", :type => :view do
  before(:each) do
    @job_post = assign(:job_post, JobPost.create!(
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
