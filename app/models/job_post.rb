class JobPost < ActiveRecord::Base

  belongs_to :company

  include Stack4stack::States
  include Stack4stack::Actions

  validates_presence_of :position, :description

end
