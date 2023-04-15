class Photo < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    
    validates :day, presence: true
    validates :park, presence: true
    validates :user_id, presence: true
end
