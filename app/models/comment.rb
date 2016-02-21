class Comment < ActiveRecord::Base
  belongs_to :task
  mount_uploader :avatars, AvatarUploader

  validates :description, presence: true
end
