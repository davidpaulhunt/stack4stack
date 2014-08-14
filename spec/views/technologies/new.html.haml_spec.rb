require 'rails_helper'

RSpec.describe "technologies/new", :type => :view do
  before(:each) do
    assign(:technology, Technology.new(
      :name => "MyString"
    ))
  end

  it "renders new technology form" do
    render

    assert_select "form[action=?][method=?]", technologies_path, "post" do

      assert_select "input#technology_name[name=?]", "technology[name]"
    end
  end
end
