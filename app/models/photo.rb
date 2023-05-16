class Photo < ApplicationRecord
    belongs_to :user
    mount_uploader :image, PhotoImageUploader
    
    validates :day, presence: true
    validates :park, presence: true
    validates :area, presence: true
    validates :image, presence: { message: "を投稿してください" }
    validates :latitude, presence: { message: "（位置情報）が未入力です。マップにピン留めしてください。" }

    validates :user_id, presence: true
end

