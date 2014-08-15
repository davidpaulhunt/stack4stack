require 'rails_helper'

RSpec.describe StackItem, :type => :model do

  context 'valid' do

    before(:each) do
      @company = FactoryGirl.create(:company_temporary)
      @stack = @company.create_stack
      @tech = FactoryGirl.create(:technology)
      @si = @stack.stack_items.build(technology: @tech)
    end

    after(:each) do
      @company.destroy!
      @stack.destroy!
      @tech.destroy!
      @si.destroy!
    end

    it 'should be valid' do
      assert_equal true, @si.valid?
    end

  end

  context 'invalid' do

    it 'should be invalid' do
      si = StackItem.new(stack: @stack)
      assert_equal true, si.invalid?

      si = StackItem.new(technology: @technology)
      assert_equal true, si.invalid?
    end

  end

end
