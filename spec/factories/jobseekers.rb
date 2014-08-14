# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jobseeker do
    email "jobseeker@email.com"
    password "password"
    password_confirmation "password"
    first_name "bob"
    last_name "smith"
  end
end
