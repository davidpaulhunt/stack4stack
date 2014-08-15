class JobPost < ActiveRecord::Base

  belongs_to :company
  has_many :job_applications, dependent: :destroy
  has_many :applicants, through: :job_applications, source: :jobseeker
  has_one :stack, as: :stackable, dependent: :destroy

  delegate :get_tech, to: :stack

  include Stack4stack::States
  include Stack4stack::Actions

  validates_presence_of :position, :description

  def compare_applicants
    scored_applications = applicants.map do |a|
      [a.id, a.graph(get_tech)]
    end

    application_distances = scored_applications.map do |sa|
      [sa[0], difference_from(sa[1])]
    end

    application_distances.sort! {|x,y| x[1] <=> y[1]}

    sorted_applicants = []

    application_distances.map.with_index do |ad, i|
      sorted_applicants[i] = applicants.find(ad[0])
    end

    sorted_applicants
  end

  def difference_from(point)
    a = get_tech.length - point[0]
    b = 0 - point[1]
    c = Math.hypot((a**2),(b**2))
    c
  end

end
