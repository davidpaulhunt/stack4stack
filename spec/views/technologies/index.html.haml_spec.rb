require 'rails_helper'

RSpec.describe "technologies/index", :type => :view do
  before(:each) do
    assign(:technologies, [
      Technology.create!(
        :name => "Name"
      ),
      Technology.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of technologies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
