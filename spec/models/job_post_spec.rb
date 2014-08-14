require 'rails_helper'

RSpec.describe JobPost, :type => :model do
  
  context 'valid' do

    it 'should be valid' do
      jp = FactoryGirl.build_stubbed(:job_post)
      assert jp.valid?
    end

    it 'should have states and actions' do
      # create new post
      jp = FactoryGirl.build_stubbed(:job_post)
      # should be open after initialize
      assert jp.open?

      # call close!
      jp.close!
      # should equal true if close! worked
      assert jp.closed?

      # call open!
      jp.open!
      # should equal true if open! worked
      assert jp.open?

      # call filled!
      jp.filled!
      # should equal true if filled! worked
      assert jp.filled?
    end

  end

  context 'invalid' do
  end

end
