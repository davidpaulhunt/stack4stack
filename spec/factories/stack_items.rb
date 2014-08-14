# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stack_item do
    association :technology, :factory => :technology
    association :stack, :factory => :stack
  end
end
