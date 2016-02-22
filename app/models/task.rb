class Task < ActiveRecord::Base
  belongs_to :project
  has_many   :comments, dependent: :destroy

  validates :priority, numericality: { only_integer: true }
  validates :text, presence: true

  before_create  :set_priority
  before_destroy :shift_priority

  def set_priority
    self.priority = project.tasks.count
  end

  def shift_priority
    project.tasks.where('priority > ?', self.priority).each do |task|
      task.priority -= 1
      task.save
    end
  end
end
