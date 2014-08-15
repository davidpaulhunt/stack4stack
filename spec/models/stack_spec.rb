require 'rails_helper'

RSpec.describe Stack, :type => :model do

  context 'valid' do

    let(:stackable) { FactoryGirl.build_stubbed(:company) }
    let(:stack) { stackable.build_stack }

    it 'should be valid' do
      assert_equal true, stack.valid?
    end

    it 'should belong to stackable' do
      assert_equal stack, stackable.stack
    end

    it 'should have attrs' do
      assert_equal "Company", stack.stackable_type
    end

  end

  context 'invalid' do

    let(:stackable) { FactoryGirl.build_stubbed(:company) }
    let(:stack) { stackable.build_stack }

    it 'has no stackable_id' do
      stack.stackable_id = nil
      assert_equal true, stack.invalid?
    end

    it 'has no stackable_type' do
      stack.stackable_type = nil
      assert_equal true, stack.invalid?
    end

  end

end
