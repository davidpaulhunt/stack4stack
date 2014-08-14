require 'rails_helper'

RSpec.describe "job_posts/new", :type => :view do
  before(:each) do
    assign(:job_post, JobPost.new(
      :company_id => 1
    ))
  end

  it "renders new job_post form" do
    render

    assert_select "form[action=?][method=?]", job_posts_path, "post" do

      assert_select "input#job_post_company_id[name=?]", "job_post[company_id]"
    end
  end
end
