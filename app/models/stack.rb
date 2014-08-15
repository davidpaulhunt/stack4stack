class Stack < ActiveRecord::Base

  belongs_to :stackable
  has_many :stack_items, dependent: :destroy
  accepts_nested_attributes_for :stack_items, allow_destroy: true, reject_if: Proc.new { |a| a['technology_id'].blank? }

  has_many :technologies, through: :stack_items

  validates_presence_of :stackable_id, :stackable_type

  def get_tech
    self.technologies.pluck(:name)
  end

end
