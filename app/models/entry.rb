class Entry < ApplicationRecord
  validates :value, presence: true

  belongs_to :category
  belongs_to :user
end
