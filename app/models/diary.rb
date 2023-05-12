class Diary < ApplicationRecord
    belongs_to :user

    has_many :diary_tags, dependent: :destroy
    has_many :tags, through: :diary_tags
    validates :day, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :user_id, presence: true

    def save_tag(sent_tags)
        current_tags = self.tags.pluck(:name) unless self.tags.nil?
        old_tags = current_tags - sent_tags
        new_tags = sent_tags - current_tags
        
        # 古いタグを削除:
        old_tags.each do |old_name|
            self.tags.delete Tag.find_by(name:old_name)
        end
        
        # 新しいタグを追加:
        new_tags.each do |new_name|
            diary_tag = Tag.find_or_create_by(name:new_name)
            self.tags << diary_tag
        end
    end
end

    