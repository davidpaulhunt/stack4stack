class Company < ActiveRecord::Base

  include User
  extend User

  has_many :job_posts, dependent: :destroy
  
end
