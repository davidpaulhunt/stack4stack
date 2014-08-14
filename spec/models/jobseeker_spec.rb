require 'rails_helper'

RSpec.describe Jobseeker, :type => :model do

  context 'valid' do

    let(:js) { FactoryGirl.build_stubbed(:jobseeker) }

    it 'should be valid' do
      # build a stub, check if valid
      # we know our user module is working because the has_secure_password is being included, which is eviden in the password, password_confirmation being valid.
      assert js.valid?
    end

    it 'should have a stack' do
      js.save!
      stack = js.create_stack
      expect(js.stack).not_to be nil

      si1 = stack.stack_items.create
      si1.build_technology(name: "ruby")

      assert ["ruby"], js.stack
    end

    it 'should have attrs' do
      assert_equal "jobseeker@email.com", js.email
      assert_equal "password", js.password
      assert_equal "password", js.password_confirmation
      assert_equal "bob", js.first_name
      assert_equal "smith", js.last_name
    end

  end

  context 'invalid' do

    it 'has no first_name' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.first_name = nil
      assert js.invalid?
    end

    it 'has no last_name' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.last_name = nil
      assert js.invalid?
    end

    it 'has no email' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.email = nil
      assert js.invalid?
    end

    it 'has no password' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.password = nil
      assert js.invalid?
    end

    it 'has wrong password_confirmation' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.password_confirmation = "wordpass"
      assert js.invalid?
    end

    it 'is not unique' do
      FactoryGirl.create(:jobseeker)
      js = FactoryGirl.build_stubbed(:jobseeker)
      assert js.invalid?
    end

  end

end