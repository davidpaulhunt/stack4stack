require 'rails_helper'

RSpec.describe StacksController, :type => :controller do

  context 'valid' do

    describe 'create' do

      it 'should assign @stack' do
        get 'new'
        expect(assigns(:stack)).to be_a_new(Stack)
      end

      it 'should create @stack' do
        stackable = FactoryGirl.create(:jobseeker)
        stack = stackable.build_stack
        stack_attrs = stack.attributes
        expect{
          post 'create', stack: stack_attrs
        }.to change(Stack, :count).by 1
      end

      it 'should create stack_items' do
        stackable = FactoryGirl.create(:jobseeker)
        stack = stackable.build_stack
        stack_attrs = stack.attributes
        tech = Technology.create(name: "ruby")
        stack_attrs['stack_items'] = {}
        stack_attrs['stack_items'][0] = {'technology_id' => '#{tech.id}'}
        expect{
          post 'create', stack: stack_attrs
        }.to change(StackItem, :count).by 1
      end

    end

    describe 'read' do

      it 'should assign @stacks' do
      end

      it 'should assign @stack' do
      end

    end

    describe 'update' do

      it 'should assign @stack' do
      end

      it 'should update @stack' do
      end

    end

    describe 'destroy' do

      it 'should assign @stack' do
      end

      it 'should destroy @stack' do
      end

    end

  end

  context 'invalid' do
  end

end