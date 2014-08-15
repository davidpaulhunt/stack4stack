require 'rails_helper'

RSpec.describe Company, :type => :model do

  context 'vaild' do

    let(:company) { FactoryGirl.build_stubbed(:company) }

    it 'should be valid' do
      assert_equal true, company.valid?
    end

    it 'should have a stack' do
      company.save!
      company.create_stack
      expect(company.stack).not_to be nil
    end

    it 'should have job_posts' do
      comp = FactoryGirl.create(:company)
      jp_attrs = FactoryGirl.attributes_for(:job_post)
      expect{ comp.job_posts.create(jp_attrs) }.to change(comp.job_posts, :count).by 1
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
      assert_equal true, company.invalid?
    end

    it 'has no email' do
      company.email = nil
      assert_equal true, company.invalid?
    end

    it 'has no password' do
      company.password = nil
      assert_equal true, company.invalid?
    end

    it 'has wrong password_confirmation' do
      company.password_confirmation = "wordpass"
      assert_equal true, company.invalid?
    end

    it 'is not unique' do
      FactoryGirl.create(:company)
      assert_equal true, company.invalid?
    end

  end

end