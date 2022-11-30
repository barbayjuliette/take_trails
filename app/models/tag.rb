class Tag < ApplicationRecord
  belongs_to :category
  belongs_to :review

  validates :review, uniqueness: { scope: :category }
end
