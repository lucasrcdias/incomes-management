class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  has_many :categories
  has_many :entries

  def incomes
    entries.income.sum(:value)
  end

  def expenses
    entries.expense.sum(:value)
  end
end
