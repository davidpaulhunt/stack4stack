require 'rails_helper'

RSpec.describe "job_posts/index", :type => :view do
  before(:each) do
    assign(:job_posts, [
      JobPost.create!(
        :company_id => 1
      ),
      JobPost.create!(
        :company_id => 1
      )
    ])
  end

  it "renders a list of job_posts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
