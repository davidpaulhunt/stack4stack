require 'rails_helper'

RSpec.describe "stacks/show", :type => :view do
  before(:each) do
    @stack = assign(:stack, Stack.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
