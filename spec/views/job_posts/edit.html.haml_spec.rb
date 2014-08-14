require 'rails_helper'

RSpec.describe "job_posts/edit", :type => :view do
  before(:each) do
    @job_post = assign(:job_post, JobPost.create!(
      :company_id => 1
    ))
  end

  it "renders the edit job_post form" do
    render

    assert_select "form[action=?][method=?]", job_post_path(@job_post), "post" do

      assert_select "input#job_post_company_id[name=?]", "job_post[company_id]"
    end
  end
end
