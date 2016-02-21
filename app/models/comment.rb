class Comment < ActiveRecord::Base
  belongs_to :task
  mount_uploaders :avatars, AvatarUploader

  validates :description, presence: true
end
