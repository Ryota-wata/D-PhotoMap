class DiaryTag < ApplicationRecord
  belongs_to :diary
  belongs_to :tag

  validates :diary_id, presence: true
  validates :tag_id, presence: true
end
