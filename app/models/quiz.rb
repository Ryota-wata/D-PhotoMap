class Quiz < ApplicationRecord
  belongs_to :user
  mount_uploader :question_image, QuestionImageUploader
  mount_uploader :answer_image, AnswerImageUploader
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :question, presence: true
  validates :answer, presence: true
end
