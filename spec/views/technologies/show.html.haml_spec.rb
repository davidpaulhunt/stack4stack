require 'rails_helper'

RSpec.describe "technologies/show", :type => :view do
  before(:each) do
    @technology = assign(:technology, Technology.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
