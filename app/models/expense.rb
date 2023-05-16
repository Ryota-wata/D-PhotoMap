class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_items, dependent: :destroy
  accepts_nested_attributes_for :expense_items, reject_if: :all_blank,allow_destroy: true

  validates :day, presence: true
  validates :total, presence: true
end
