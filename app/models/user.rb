class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :photos, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :lottelies, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :quizzes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true
end
