class JobApplication < ActiveRecord::Base

  belongs_to :jobseeker
  belongs_to :job_post

end
