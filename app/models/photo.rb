class Photo < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    
    validates :day, presence: true
    validates :park, presence: true
    validates :area, presence: true
    validates :user_id, presence: true

    geocoded_by :park
    after_validation :geocode, if: :park_changed?

    def image_url
        image.attached? ? image.blob.service_url : nil
    end

    def image_url=(url)
        self.image.attach(io: File.open(url), filename: "image.jpg")
    end

end

