require 'rails_helper'

RSpec.describe "stacks/edit", :type => :view do
  before(:each) do
    @stack = assign(:stack, Stack.create!())
  end

  it "renders the edit stack form" do
    render

    assert_select "form[action=?][method=?]", stack_path(@stack), "post" do
    end
  end
end
