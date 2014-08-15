class StackItem < ActiveRecord::Base

  belongs_to :stack
  belongs_to :technology

  validates_presence_of :technology_id
  
end
