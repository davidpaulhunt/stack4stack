require 'rails_helper'

RSpec.describe "stacks/index", :type => :view do
  before(:each) do
    assign(:stacks, [
      Stack.create!(),
      Stack.create!()
    ])
  end

  it "renders a list of stacks" do
    render
  end
end
