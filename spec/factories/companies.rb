# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "my company"
    email "company@email.com"
    password "password"
    password_confirmation "password"
  end
end
