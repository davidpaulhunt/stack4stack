require 'rails_helper'

RSpec.describe "technologies/edit", :type => :view do
  before(:each) do
    @technology = assign(:technology, Technology.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit technology form" do
    render

    assert_select "form[action=?][method=?]", technology_path(@technology), "post" do

      assert_select "input#technology_name[name=?]", "technology[name]"
    end
  end
end
