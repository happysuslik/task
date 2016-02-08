class Task < ActiveRecord::Base
  belongs_to :user

  validates :text, presence: true
end
