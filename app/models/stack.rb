class Stack < ActiveRecord::Base

  belongs_to :stackable
  has_many :stack_items, dependent: :destroy
  has_many :technologies, through: :stack_items

  validates_presence_of :stackable_id
  validates_presence_of :stackable_type

  def to_s
    self.technologies.pluck(:name)
  end

end
