class Task < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, TaskImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
end
