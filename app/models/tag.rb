class Tag < ApplicationRecord
  has_many :diary_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :diaries, through: :diary_tags
end
