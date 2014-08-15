require 'rails_helper'

RSpec.describe JobApplication, :type => :model do

  context 'valid' do

    before(:each) do
      js = FactoryGirl.create(:jobseeker)
      jp = FactoryGirl.create(:job_post)
      @jobapp = js.job_applications.create(job_post: jp)
    end

    after(:each) do
      @jobapp.destroy!
    end

    it 'should be valid' do
      expect(@jobapp.valid?).to eq true
    end

    it 'should have a jobpost' do
      expect(@jobapp.job_post).not_to eq nil
    end

    it 'should have a jobseeker' do
      expect(@jobapp.jobseeker).not_to eq nil
    end

  end

  context 'invalid' do

    it 'should be invalid' do
      jobapp = JobApplication.new
      expect(jobapp.invalid?).to eq true
    end

  end

end
