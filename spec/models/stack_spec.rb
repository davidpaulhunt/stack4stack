require 'rails_helper'

RSpec.describe Stack, :type => :model do

  context 'valid' do

    let(:stackable) { FactoryGirl.build_stubbed(:company) }
    let(:stack) { stackable.build_stack }

    it 'should be valid' do
      assert stack.valid?
    end

    it 'should belong to stackable' do
      assert_equal stack, stackable.stack
    end

    it 'should have attrs' do
      assert_equal "Company", stack.stackable_type
    end

    it 'should print technologies on stack' do
      stackable.save!
      stack = stackable.create_stack
      assert 1, Stack.all.count

      si1 = stack.stack_items.create
      si1.create_technology(name: "ruby")

      si2 = stack.stack_items.create
      si2.create_technology(name: "rails")
      
      assert 2, stack.stack_items.count
      assert 2, StackItem.all.count

      assert 2, stack.technologies.count

      assert ["ruby", "rails"], stack
    end

  end

  context 'invalid' do

    let(:stackable) { FactoryGirl.build_stubbed(:company) }
    let(:stack) { stackable.build_stack }

    it 'has no stackable_id' do
      stack.stackable_id = nil
      assert stack.invalid?
    end

    it 'has no stackable_type' do
      stack.stackable_type = nil
      assert stack.invalid?
    end

  end

end
