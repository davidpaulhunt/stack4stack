require 'rails_helper'

RSpec.describe Technology, :type => :model do

  context 'valid' do

    it 'should be valid' do
      tech = FactoryGirl.build_stubbed(:technology)
      assert_equal true, tech.valid?
    end

    it 'should have attrs' do
      tech = FactoryGirl.build_stubbed(:technology)
      assert_equal "ruby", tech.name
    end

  end

  context 'invalid' do

    it 'should be invalid' do
      tech = Technology.new
      assert_equal true, tech.invalid?
    end

  end

end
