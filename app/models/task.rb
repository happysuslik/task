class Task < ActiveRecord::Base
  belongs_to :project

  validates :text, presence: true
end
