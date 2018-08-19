class Category < ApplicationRecord
  enum kind: { income: 'income', expense: 'expense' }
  validates :name, :kind, :icon, :user, presence: true
  validates :planned, presence: true, if: :expense?

  belongs_to :user
  has_many :entries, dependent: :destroy_all
end
