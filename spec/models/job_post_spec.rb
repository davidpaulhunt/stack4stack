require 'rails_helper'

RSpec.describe JobPost, :type => :model do
  
  context 'valid' do

    it 'should be valid' do
      jp = FactoryGirl.build_stubbed(:job_post)
      assert_equal true, jp.valid?
    end

    it 'should have states and actions' do
      # create new post
      jp = FactoryGirl.build_stubbed(:job_post)
      # should be open after initialize
      assert_equal true, jp.open?

      # call close!
      jp.close!
      # should equal true if close! worked
      assert_equal true, jp.closed?

      # call open!
      jp.open!
      # should equal true if open! worked
      assert_equal true, jp.open?

      # call filled!
      jp.filled!
      # should equal true if filled! worked
      assert_equal true, jp.filled?
    end

    it 'can compare applicants' do
      tech = []
      tech[0] = Technology.create(name: "ruby")
      tech[1] = Technology.create(name: "rails")
      tech[2] = Technology.create(name: "coffeescript")
      tech[3] = Technology.create(name: "haml")
      tech[4] = Technology.create(name: "css")
      tech[5] = Technology.create(name: "javascript")
      tech[6] = Technology.create(name: "html")

      jp = FactoryGirl.create(:job_post)
      stack = jp.create_stack
      pos = 0
      5.times do
        stack.stack_items.create(technology: tech[pos])
        pos += 1
      end
      expect(jp.get_tech).to eq tech.first(5).map{|t|t.name}
      
      js = []
      js[0] = FactoryGirl.create(:jobseeker)
      js[1] = FactoryGirl.create(:jobseeker_two)
      js[2] = FactoryGirl.create(:jobseeker_three)

      js.map do |j|
        j.create_stack
        j.apply(jp)
      end

      pos = 0
      5.times do
        js[0].stack.stack_items.create(technology: tech[pos])
        pos += 1
      end
      expect(js[0].get_tech).to eq tech.first(5).map{|t|t.name}

      pos = 6
      5.times do
        js[1].stack.stack_items.create(technology: tech[pos])
        pos -= 1
      end
      expect(js[1].get_tech).to eq tech.last(5).map{|t|t.name}

      pos = 1
      4.times do
        js[2].stack.stack_items.create(technology: tech[pos])
        pos += 1
      end
      expect(js[2].get_tech).to eq [tech[1].name,tech[2].name,tech[3].name,tech[4].name]

      expect(jp.compare_applicants).to eq [js[0],js[2],js[1]]
    end

  end

  context 'invalid' do
  end

end
