# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_post do
    association :company, :factory => :company
    position "Ruby on Rails Developer"
    description """We're looking for a problem solver with great knowledge of Ruby on Rails. Anyone who can utilize Javascript frameworks like Angular.js would be nice to.

    We're open to many skill levels and personalities.

    """
    requirements """Ruby on Rails
    HTML
    Javascript
    Coffeescript
    Heroku
    """
  end
end
