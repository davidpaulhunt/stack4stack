# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stack do
    association :stackable, :factory => :company
  end
end
