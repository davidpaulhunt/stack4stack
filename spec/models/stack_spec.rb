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

    it 'should build stack items' do
      tech = Technology.create!(name: 'ruby')
      stack1 = stack
      stack1.stack_items.build(technology_id: tech.id)
      stack1.save!
      expect(Stack.last.stack_items.count).not_to eq 0
      expect(Stack.last.stack_items.first.stack_id).to eq stack1.id
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
