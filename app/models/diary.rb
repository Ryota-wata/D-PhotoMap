class Diary < ApplicationRecord
    belongs_to :user
    
    validates :day, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :user_id, presence: true
end

    