require 'rails_helper'

RSpec.describe Company, :type => :model do

  context 'vaild' do

    let(:company) { FactoryGirl.build_stubbed(:company) }

    it 'should be valid' do
      assert company.valid?
    end

    it 'should have a stack' do
      company.save!
      company.create_stack
      expect(company.stack).not_to be nil

      si1 = company.stack.stack_items.create
      si1.build_technology(name: "ruby")

      assert ["ruby"], company.stack
    end

    it 'should have job_posts' do
      company.save!
      company.job_posts.build
      assert 1, company.job_posts.count
    end

    it 'should have attrs' do
      company = FactoryGirl.build_stubbed(:company)
      assert_equal "my company", company.name
      assert_equal "company@email.com", company.email
      assert_equal "password", company.password
      assert_equal "password", company.password_confirmation
    end

  end

  context 'invalid' do

    let(:company) { FactoryGirl.build_stubbed(:company) }

    it 'has no name' do
      company.name = nil
      assert company.invalid?
    end

    it 'has no email' do
      company.email = nil
      assert company.invalid?
    end

    it 'has no password' do
      company.password = nil
      assert company.invalid?
    end

    it 'has wrong password_confirmation' do
      company.password_confirmation = "wordpass"
      assert company.invalid?
    end

    it 'is not unique' do
      FactoryGirl.create(:company)
      assert company.invalid?
    end

  end

end