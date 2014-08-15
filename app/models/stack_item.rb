class StackItem < ActiveRecord::Base

  belongs_to :stack
  belongs_to :technology

  validates_presence_of :stack_id, :technology_id
  
end
