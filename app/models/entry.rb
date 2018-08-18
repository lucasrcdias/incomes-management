class Entry < ApplicationRecord
  validates :value, presence: true

  belongs_to :category
  belongs_to :user

  scope :income,  -> { includes(:category).where(categories: { kind: Category.kinds[:income] }) }
  scope :expense, -> { includes(:category).where(categories: { kind: Category.kinds[:expense] }) }
end
