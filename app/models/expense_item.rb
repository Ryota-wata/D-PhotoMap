class ExpenseItem < ApplicationRecord
  belongs_to :expense

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :subtotal, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
