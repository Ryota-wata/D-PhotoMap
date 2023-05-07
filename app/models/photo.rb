class Photo < ApplicationRecord
    belongs_to :user
    mount_uploader :image, PhotoImageUploader
    
    validates :day, presence: true
    validates :park, presence: true
    validates :area, presence: true
    validates :user_id, presence: true
end

