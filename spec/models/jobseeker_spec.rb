require 'rails_helper'

RSpec.describe Jobseeker, :type => :model do

  context 'valid' do

    let(:js) { FactoryGirl.build_stubbed(:jobseeker) }

    it 'should be valid' do
      # build a stub, check if valid
      # we know our user module is working because the has_secure_password is being included, which is eviden in the password, password_confirmation being valid.
      assert_equal true, js.valid?
    end

    it 'should have a stack' do
      js1 = FactoryGirl.create(:jobseeker)
      stack = js1.create_stack
      expect(js1.stack).not_to be nil

      tech = FactoryGirl.create(:technology)
      si1 = stack.stack_items.create!(technology: tech)

      expect(js1.stack.technologies.count).to eq 1
      expect(js1.stack.get_tech).to eq ["ruby"]
    end

    it 'should have attrs' do
      assert_equal "jobseeker@email.com", js.email
      assert_equal "password", js.password
      assert_equal "password", js.password_confirmation
      assert_equal "bob", js.first_name
      assert_equal "smith", js.last_name
    end

    it 'should be able to apply' do
      js1 = FactoryGirl.create(:jobseeker)
      stack = js1.create_stack
      expect(js1.stack).not_to be nil

      tech = FactoryGirl.create(:technology)
      si1 = stack.stack_items.create!(technology: tech)

      expect(js1.stack.get_tech).to eq ["ruby"]
      
      jp = FactoryGirl.create(:job_post)
      assert_equal 1, JobPost.all.count

      js1.apply(jp)

      expect(js1.job_applications.count).to eq 1
      expect(jp.applicants.count).to eq 1

      js1.unapply(jp)

      expect(js1.job_applications.count).to eq 0
      expect(jp.applicants.count).to eq 0
    end

    it 'can compare stacks by tech' do
      js1 = FactoryGirl.create(:jobseeker)
      stack = js1.create_stack
      tech = []
      tech[0] = Technology.create(name: "ruby")
      tech[1] = Technology.create(name: "rails")
      tech[2] = Technology.create(name: "coffeescript")
      tech.map {|t| stack.stack_items.create(technology: t)}
      arry = ["ruby", "rails", "coffeescript"]
      expect(js1.compare_stack(arry)).to eq [1,1,1]
      expect(js1.score(arry)).to eq 3
      expect(js1.graph(arry)).to eq [3,0]
    end

  end

  context 'invalid' do

    it 'has no first_name' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.first_name = nil
      assert_equal true, js.invalid?
    end

    it 'has no last_name' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.last_name = nil
      assert_equal true, js.invalid?
    end

    it 'has no email' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.email = nil
      assert_equal true, js.invalid?
    end

    it 'has no password' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.password = nil
      assert_equal true, js.invalid?
    end

    it 'has wrong password_confirmation' do
      js = FactoryGirl.build_stubbed(:jobseeker)
      js.password_confirmation = "wordpass"
      assert_equal true, js.invalid?
    end

    it 'is not unique' do
      FactoryGirl.create(:jobseeker)
      js = FactoryGirl.build_stubbed(:jobseeker)
      assert_equal true, js.invalid?
    end

  end

end