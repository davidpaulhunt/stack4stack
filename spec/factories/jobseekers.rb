# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jobseeker do
    email "jobseeker@email.com"
    password "password"
    password_confirmation "password"
    first_name "bob"
    last_name "smith"
  end

  factory :jobseeker_two, parent: :jobseeker, class: Jobseeker do
    email "jobseeker2@email.com"
  end

  factory :jobseeker_three, parent: :jobseeker, class: Jobseeker do
    email "jobseeker3@email.com"
  end
end
