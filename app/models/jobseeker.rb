class Jobseeker < ActiveRecord::Base

  include User
  extend User

  has_many :job_applications, dependent: :destroy

  def apply(jobpost_id)
    jobpost = JobPost.find(jobpost_id)
    self.job_applications.create!(job_post_id: jobpost.id)
  end

  def unapply(jobpost)
    ja = self.job_applications.where(job_post_id: jobpost.id)
    self.job_applications.delete(ja)
  end

  def compare_stack(tech)
    compare_score = tech.map do |t|
      get_tech.include?(t) ? 1 : 0
    end
    compare_score
  end

  def score(tech)
    score = 0
    compare_stack(tech).map do |c|
      score += c
    end
    score
  end

  def graph(tech)
    x = score(tech)
    y = tech.count - x
    return x, y
  end

end
