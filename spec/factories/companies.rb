# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "my company"
    email "company@email.com"
    password "password"
    password_confirmation "password"
  end

  factory :company_temporary, parent: :company, class: Company do
    name "my other company"
    email "anotherco@email.com"
    password "password"
    password_confirmation "password"
  end
end
