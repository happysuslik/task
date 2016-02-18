class Comment < ActiveRecord::Base
  belongs_to :task
  mount_uploader :avatar, AvatarUploader

  validates :description, presence: true
end
