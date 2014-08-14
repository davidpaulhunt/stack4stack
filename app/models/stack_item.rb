class StackItem < ActiveRecord::Base

  belongs_to :stack
  belongs_to :technology
  
end
