require 'rails_helper'

RSpec.describe "stacks/new", :type => :view do
  before(:each) do
    assign(:stack, Stack.new())
  end

  it "renders new stack form" do
    render

    assert_select "form[action=?][method=?]", stacks_path, "post" do
    end
  end
end
