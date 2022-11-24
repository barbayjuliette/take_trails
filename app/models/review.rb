class Review < ApplicationRecord
  belongs_to :trip
  validates :content, length: { minimum: 10 }
end
