class JobApplication < ActiveRecord::Base

  belongs_to :jobseeker
  belongs_to :job_post

  validates_presence_of :jobseeker_id, :job_post_id

end
