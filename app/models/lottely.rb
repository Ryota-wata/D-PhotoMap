class Lottely < ApplicationRecord
    belongs_to :user

    validates :day, presence: true 
    validates :facility, presence: true
    validates :time, presence: true
    validates :result, presence: true
end
